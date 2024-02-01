using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Services.Interfaces;
using System;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.Services
{
    public class ActionLogService : IActionLogService
    {
        private readonly IActionLogBL bl;

        public ActionLogService(IActionLogBL actionLogBL)
        {
            this.bl = actionLogBL;
        }

        public T Delete<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }

        public Task<T> DeleteAsync<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }

        public T Get<T, M>(M query) where T : new()
        {
            throw new NotImplementedException();
        }

        public Task<T> GetAsync<T, M>(M query) where T : new()
        {
            throw new NotImplementedException();
        }

        public T Save<T, M>(M command) where T : new()
        {
            var vm = bl.Save<T, M>(command);
            return vm;
        }

        public Task<T> SaveAsync<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }
    }
    }