using System.Threading.Tasks;

namespace iRoads.DigitalArchive.Services.Interfaces
{
    public interface IServiceBase
    {
        T Get<T, M>(M query)
               where T : new();
        Task<T> GetAsync<T, M>(M query)
            where T : new();
        T Save<T, M>(M command)
            where T : new();
        Task<T> SaveAsync<T, M>(M command)
            where T : new();
        T Delete<T, M>(M command)
            where T : new();
        Task<T> DeleteAsync<T, M>(M command)
            where T : new();
    }
}
