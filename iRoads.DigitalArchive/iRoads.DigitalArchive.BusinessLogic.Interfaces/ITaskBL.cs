using iRoads.DigitalArchive.Models.Model;
using Ness.Framework.BusinessLogic;
using System;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic.Interfaces
{
    public interface ITaskBL : IBaseBL
    {
        Task RunSchedular();
        Task RunSchedular(int TaskTypeCode, DateTime nextRunTime);
        Task AddTaskJob(TaskJob taskJob);
    }
}
