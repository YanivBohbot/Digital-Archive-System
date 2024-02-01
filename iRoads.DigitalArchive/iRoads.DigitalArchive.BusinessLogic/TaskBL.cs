using AutoMapper;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Entities.Dbo;
using iRoads.DigitalArchive.Models.Enums;
using iRoads.DigitalArchive.Models.Model;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Utils;
using NHibernate.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic
{
    public class TaskBL : BaseBL, ITaskBL
    {
        private readonly static SemaphoreSlim semaphore = new SemaphoreSlim(1, 1);
        private DateTime now = DateTime.Now.Now();
        public TaskBL(IRepository repository, IMapper mapper) : base(repository, mapper)
        {

        }

        #region Public Methods

        public async Task RunSchedular()
        {

            IList<Entities.Dbo.Taskschedular> schedulars = null;
            await _repository[currentRepository].ExecuteAsync(async session =>
            {
                schedulars = await session.Query<Entities.Dbo.Taskschedular>()
                   .Where(x => ((x.NextRunTime <= now && x.TaskState == (int)TaskState.New)
                            || (x.NextRunTime < now.Date && x.TaskState == (int)TaskState.InProgress))
                       && x.IsRowDeleted == false).ToListAsync();
            });

            foreach (var schedular in schedulars)
            {

                if (now.Hour < schedular.NextRunTime.Hour) continue; //wait for correct hour                               

                IList<Entities.Dbo.Tasktriggers> taskTriggers = null;
                await _repository[currentRepository].ExecuteAsync(async session =>
                {
                    taskTriggers = await session.Query<Entities.Dbo.Tasktriggers>()
                        .Where(x => x.TaskTypeCode == schedular.TaskTypeCode
                        && x.IsRowDeleted == false).ToListAsync();
                });

                var list = taskTriggers.Select(x => new { x.DayOfWeek, day = (int)now.DayOfWeek - ((int)x.DayOfWeek % 7), x.StartHour, x.EndHour })
                        .Where(x => x.day <= 0)
                        .ToList();

                int i = 0;

                var triggers = list.Select(x => new { Idx = i++, x.DayOfWeek, x.day, x.StartHour, x.EndHour }).ToList();

                if (triggers == null)
                {
                    continue;
                }

                var trigger = triggers.Where(x => x.DayOfWeek == (int)now.DayOfWeek
                                        && (int.Parse(x.StartHour) <= now.Hour && int.Parse(x.EndHour) >= now.Hour)
                                        ).LastOrDefault();

                if (trigger == null)
                {
                    continue;
                }

                int row = trigger.Idx + 1;
                var nextTrigger = triggers.Where(x => x.Idx == row).FirstOrDefault();
                if (nextTrigger == null)
                {
                    nextTrigger = trigger;
                }
                var nextRun = now.AddDays(nextTrigger.day * -1);
                var nextRunTime = new DateTime(nextRun.Year, nextRun.Month, nextRun.Day, int.Parse(nextTrigger.StartHour), 0, 0);

                await RunTask(schedular, nextRunTime);
            }
        }

        public async Task RunSchedular(int TaskTypeCode, DateTime nextRunTime)
        {
            Entities.Dbo.Taskschedular schedular = null;
            await _repository[currentRepository].ExecuteAsync(async session =>
            {
                schedular = await session.Query<Entities.Dbo.Taskschedular>()
                   .Where(x => x.TaskTypeCode == TaskTypeCode)
                   .FirstOrDefaultAsync(x => x.IsRowDeleted == false);

            });
            if (schedular == null) return;

            schedular.NextRunTime = nextRunTime;
            await UpdateScheduler(schedular, TaskState.New, false);
        }

        public async Task AddTaskJob(TaskJob taskJob)
        {
            var item = _mapper.Map<Models.Model.TaskJob, Entities.Dbo.Taskjobs>(taskJob);
            item.TaskState = (int)TaskState.New;
            await SaveAsync(item);
        }

        #endregion

        #region Task Update Manager
        private async Task<IList<Entities.Dbo.Taskjobs>> Get(int TaskTypeCode)
        {
            IList<Entities.Dbo.Taskjobs> jobs = null;
            await _repository[currentRepository].ExecuteAsync(async session =>
            {
                jobs = await session.Query<Entities.Dbo.Taskjobs>()
                    .Where(x => x.TaskTypeCode == TaskTypeCode
                        && x.TaskState == (int)TaskState.New
                        || (x.TaskState == (int)TaskState.InProgress && x.UpdateDate < now.Date)
                    && x.IsRowDeleted == false).ToListAsync();
            });

            return jobs;
        }

        private async Task UpdateTaskJob(Taskjobs item, TaskState taskState, bool cancelTask = false)
        {
            item.TaskState = (int)taskState;
            await SaveAsync(item);
        }

        private async Task UpdateScheduler(Taskschedular item, TaskState taskState, bool failed)
        {
            item.TaskState = (int)taskState;
            item.LastRunTime = DateTime.Now.Now();
            item.TaskStatus = true;

            if (failed)
            {
                item.TaskStatus = false;
            }

            await SaveAsync(item);
        }
        #endregion

        #region Task Process Manager
        private async Task RunTask(Taskschedular schedular, DateTime nextRunTime)
        {
            try
            {
                await UpdateScheduler(schedular, TaskState.InProgress, false);

                switch (schedular.TaskTypeCode)
                {
                    case 1:
                        await ExecuteTask(schedular.TaskTypeCode);
                        // OR you can use RunTask (if don't need TaskJobs Records)
                        // RunTask (schedular.TaskTypeCode)
                        break;
                    default:
                        throw new Exception("missing Task");
                }

                schedular.Error = "";
                schedular.NextRunTime = nextRunTime;
                await UpdateScheduler(schedular, TaskState.New, false);

            }
            catch (Exception ex)
            {
                schedular.Error = "error: " + ex.Message;
                await UpdateScheduler(schedular, TaskState.New, true);
            }
        }

        private async Task ExecuteTask(int TaskTypeCode)
        {
            var taskJobs = await Get(TaskTypeCode);
            foreach (var item in taskJobs)
            {
                await UpdateTaskJob(item, TaskState.InProgress);
                RunTask(item);
                await UpdateTaskJob(item, TaskState.Finished);
            }

        }

        private void RunTask(int TaskTypeCode)
        {
            var taskJob = new Taskjobs();
            taskJob.TaskTypeCode = TaskTypeCode;

            Task t = Task.Factory.StartNew(async () => { await RunTaskAsync(taskJob); });

        }

        private void RunTask(Taskjobs taskJob)
        {
            Task t = Task.Factory.StartNew(async () => { await RunTaskAsync(taskJob); });
        }
        #endregion

        #region BL - Create Tasks
        private async Task RunTaskAsync(Taskjobs taskJob)
        {
            await semaphore.WaitAsync();
            switch (taskJob.TaskTypeCode)
            {
                case 1:
                    //Call SP Or BL Execution Method    
                    await ExecuteTaskSample(taskJob);
                    break;

                default:
                    break;
            }
            semaphore.Release();

        }
        public async Task ExecuteTaskSample(Taskjobs taskJob)
        {
            //List<PortfolioDetails> res = new List<PortfolioDetails>();
            //var parameters = new Dictionary<string, Tuple<object, NHibernate.Type.IType>>();
            //parameters.Add("UserId", new Tuple<object, NHibernate.Type.IType>(userId, NHibernate.NHibernateUtil.Int64));
            //var portfolios = _repository.ExecuteSp<UserPortfolio>("GetUserPortfolioNew", parameters);

            var parameters = new Dictionary<string, Tuple<object, NHibernate.Type.IType>>();
            await _repository[currentRepository].ExecuteSpAsync("JobRebuildAllIndexes", parameters);

        }
        #endregion

    }
}
