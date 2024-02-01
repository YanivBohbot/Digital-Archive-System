using AutoMapper;
using iRoads.DigitalArchive.BusinessLogic.Interfaces;
using iRoads.DigitalArchive.Razor.Models.Email;
using Microsoft.Extensions.Configuration;
using Ness.DataAccess.Repository.CrossPlatform;
using Ness.Framework.BusinessLogic;
using Ness.Framework.Core.Utils;
using Ness.Framework.Razor;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Mail;
using System.Threading.Tasks;

namespace iRoads.DigitalArchive.BusinessLogic
{
    public class MailBL : BaseBL, IMailBL
    {
        private readonly IAppBL _appBL;
        private readonly IMail _mail;
        private readonly ISms _smsService;
        private readonly IConfiguration _configuration;
        // private readonly IMessage _message;

        public MailBL(IRepository repository, IAppBL appBL, IMail mail, ISms smsService, IMapper mapper, IConfiguration configuration
            //, IMessage message
            ) : base(repository, mapper)
        {
            _appBL = appBL;
            _mail = mail;
            _smsService = smsService;
            _configuration = configuration;
            //  _message = message;
        }

        #region Props
        private IList<Ness.Framework.Razor.Models.BaseModel> _models;
        private IList<Ness.Framework.Razor.Models.BaseModel> MailModels()
        {
            if (_models == null)
                _models = new List<Ness.Framework.Razor.Models.BaseModel>();

            return _models;
        }

        #endregion

        #region Public Methods

        public async Task Send()
        {
            await SendMessages();
        }

        public void MailComposer(Ness.Framework.Razor.Models.BaseModel model)
        {
            MailModels().Add(model);
        }

        public Ness.Framework.Razor.Models.BaseModel Composer<T>(int UserName, string password)
        {
            var user = GetUser(UserName);
            var type = typeof(T);

            if (type == typeof(Razor.Models.Email.ResetPassword))
            {
                return new Razor.Models.Email.ResetPassword { NewPassword = password, User = user };
            }


            return new Ness.Framework.Razor.Models.BaseModel { User = user };
        }

        public string SendOtp(string UserName)
        {
            //var user = GetUser(UserName);

            //PfAuthParams pfAuthParams = new PfAuthParams();
            //pfAuthParams.Phone = user.Phone; //TODO: check is 972 is needed before the cellphone number
            //pfAuthParams.Mode = pf_auth.MODE_SMS_ONE_WAY_OTP;
            //pfAuthParams.SmsText = "אנא הזן את הקוד <$otp$> כדי לקבל גישה למערכת.";
            //pfAuthParams.CertFilePath = HttpContext.Current.Server.MapPath("~\\App_Data\\cert_key.p12");

            //string otp;
            //int callStatus, errorId;

            //// הפרמטר "otp" מכיל את מפתח הגישה שנוצר על ידי המערכת ונשלח לטלפון היעד
            //bool res = pf_auth.pf_authenticate(pfAuthParams, out otp, out callStatus, out errorId);

            //// את קוד המצב 'callStatus == 20' מציין כי SMS נשלחה בהצלחה
            //if (callStatus != 20)
            //{
            //    return string.Empty;
            //}
            //otp = TokenService.GenerateToken(otp.ToString(), "127.0.0.1", "user", DateTime.Now.Ticks);
            //return otp;

            //Infrastructure MFA (OTP) Implementation
            return "";
        }

        #endregion

        #region Get Data

        private Models.Model.User GetUser(int UserName)
        {
            Models.Model.User user = null;
            _repository[currentRepository].Execute(session =>
            {
                var users = session.Get<Entities.Site.Users>(UserName);
                user = _mapper.Map<Models.Model.User>(users);
            });
            return user;
        }


        #endregion

        #region Reused Mail Methods


        private async Task SendMessages()
        {
            await SendMessagesAsync();
        }
        private async Task SendMessagesAsync()
        {
            await SendAsync();
        }
        private async Task SendAsync()
        {

            var models = _models;
            //reset objects
            _models = null;
            //send messages in same order was added to collection
            foreach (var message in models)
            {
                var name = message.GetType().Namespace;
                if (name.Contains(".SMS"))
                {
                    // _message.Send<Razor.Models.BaseModel, Razor.Models.BaseMessage>(message);
                    await _smsService.Send<Ness.Framework.Razor.Models.BaseModel, Ness.Framework.Razor.Models.BaseMessage>(message);
                }
                else
                {
                    //await _mail.Send<Ness.Framework.Razor.Models.BaseModel, Ness.Framework.Razor.Models.BaseMessage>(message);
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient(_configuration["MailSetting:Host"]);
                    mail.From = new MailAddress(_configuration["MailSetting:from"]);
                    foreach(string address in (message as EmailModel).Emails)
                    {
                        mail.To.Add(address);
                    }
                    //mail.To.Add(message.Email);
                    mail.Subject = message.Subject;
                    mail.Body = message.Title;

                    System.Net.Mail.Attachment attachment;
                    foreach (string item in (message as EmailModel).Attachments)
                    {
                        attachment = new System.Net.Mail.Attachment(item);
                        mail.Attachments.Add(attachment);
                    }
                   
                    

                    SmtpServer.Port = Int32.Parse(_configuration["MailSetting:Port"]);
                    //SmtpServer.Credentials = new System.Net.NetworkCredential("your mail@gmail.com", "your password");
                    SmtpServer.EnableSsl = false;

                    SmtpServer.Send(mail);
                }
            }

        }

        #endregion
    }
}
