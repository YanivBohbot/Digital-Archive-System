﻿using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Services.Interfaces;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.Services
{
    public class SOAProjectsService : ISOAProjectsService
    {

        private readonly ISOAProjectsBL bl;

        public SOAProjectsService(ISOAProjectsBL soaProjectsBL)
        {
            this.bl = soaProjectsBL;
        }
        public T Delete<T, M>(M command) where T : new()
        {
            var vm = bl.Delete<T, M>(command);
            return vm;
        }

        public async Task<T> DeleteAsync<T, M>(M command) where T : new()
        {
            var vm = await bl.DeleteAsync<T, M>(command);
            return vm;
        }

        public T Get<T, M>(M query) where T : new()
        {
            var vm = bl.Get<T, M>(query);
            return vm;
        }

        public async Task<T> GetAsync<T, M>(M query) where T : new()
        {
            var vm = await bl.GetAsync<T, M>(query);
            return vm;
        }

        public T Save<T, M>(M command) where T : new()
        {
            var vm = bl.Save<T, M>(command);
            return vm;
        }

        public async Task<T> SaveAsync<T, M>(M command) where T : new()
        {
            var vm = await bl.SaveAsync<T, M>(command);
            return vm;
        }
    }
}
