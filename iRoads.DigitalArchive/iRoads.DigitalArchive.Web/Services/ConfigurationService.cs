using ConfigurationManager = System.Configuration.ConfigurationManager;

namespace iRoads.DigitalArchive.Web.Services
{
    public class ConfigurationService
    {
        public string innerHostAddressAuth()
        {
            return ConfigurationManager.AppSettings["innerHostAddressAuth"];
        }
        public string InnerHostAddress()
        {
            return ConfigurationManager.AppSettings["innerHostAddress"];
        }
        public string RechaptchaUrl()
        {
            return ConfigurationManager.AppSettings["rechaptchaUrl"];
        }

        public string GetThumbprint()
        {
            return ConfigurationManager.AppSettings["Thumbprint"];
        }

        public string GetThumbprintAuth()
        {
            return ConfigurationManager.AppSettings["ThumbprintAuth"];
        }

        public string GetRecaptchaPrivateKey()
        {
            return ConfigurationManager.AppSettings["recaptchaPrivateKey"];
        }

        public int GetAppCode()
        {
            int appCode = 1;
            int.TryParse(ConfigurationManager.AppSettings["appCode"], out appCode);
            return appCode;
        }
    }
}