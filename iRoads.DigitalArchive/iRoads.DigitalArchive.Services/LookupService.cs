using iRoads.DigitalArchive.Services.Interfaces;
using Ness.Framework.BusinessLogic;
using System;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.Services
{
    public class LookupService : ILookupService
    {
        private ILookupBL _lookupBL;

        public LookupService(ILookupBL lookupBL)
        {
            _lookupBL = lookupBL;
        }
        public T Delete<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }

        public T Get<T, M>(M query) where T : new()
        {
            throw new NotImplementedException();
        }

        public T Save<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }
        public async Task<T> SaveAsync<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }
        public async Task<T> DeleteAsync<T, M>(M command) where T : new()
        {
            throw new NotImplementedException();
        }
        public async Task<T> GetAsync<T, M>(M query) where T : new()
        {
            var vm = await _lookupBL.GetAsync<T, M>(query);
            return vm;
        }
    }
}
