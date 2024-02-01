using iRoads.DigitalArchive.Models.Command;
using iRoads.DigitalArchive.Models.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Ness.Framework.Models.App;
using Ness.Framework.Models.Viewmodel;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.DirectoryServices.AccountManagement;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using LogLevel = Ness.Framework.Models.App.LogLevel;
using iRoads.DigitalArchive.IdentificationApp.Models;
using iRoads.DigitalArchive.IdentificationApp.Helpers;
using ILogger = Ness.Framework.Core.Interfaces.Log.ILogger;

namespace iRoads.DigitalArchive.Web.Controllers
{
	[Route("api/Login")]
	public class LoginController : Controller
	{
		private readonly IConfiguration configuration;
		private string userName;
		private readonly PrincipalContext domain;
		private string AuthenticationType;
		private readonly string className;
		private readonly string baseUrl;
		private readonly INetworkHttpClient httpClient;
		private readonly ILogger logger;



		public LoginController(IConfiguration configuration, INetworkHttpClient httpClient, ILogger logger)
		{
			this.configuration = configuration;
			domain = new PrincipalContext(ContextType.Domain);
			baseUrl = configuration["BaseUrl"];
			this.httpClient = httpClient;
			this.logger = logger;
		}




		[HttpGet]
		public IActionResult Login([FromQuery] LoginCommand c)
		{
			IActionResult? response = null;
			try
			{
				logger.LogInfo(className, "Login", "START", JsonConvert.SerializeObject(c));
				var vm = Get_LoggedOnUserData(c);


				var user = vm.Details;

				if (user != null)
				{
					var tokenString = GenerateJSONWebToken(user);
					response = Ok(new { token = tokenString, Details = user });

				}
				else
				{
					switch (vm.Status)
					{
						case 1:
							response = BadRequest(new { details = vm.Messages.FirstOrDefault() });
							break;
						case 2:
							response = NotFound(new { details = vm.Messages.FirstOrDefault() });
							break;
						case 3:
							response = NotFound(new { details = vm.Messages.FirstOrDefault() });
							break;
						default:
							response = Unauthorized(new { details = vm.Messages.FirstOrDefault() });
							break;
					}
				}
				logger.LogInfo(className, "Login", "END", JsonConvert.SerializeObject(response));

			}
			catch (Exception e)
			{

				logger.LogError(className, "Login", e.Message, JsonConvert.SerializeObject(c), e);

			}


			return response;
		}


		private string GenerateJSONWebToken(User user)
		{

			logger.LogInfo(className, "GenerateJSONWebToken", "START", JsonConvert.SerializeObject(user));
			JwtSecurityToken token = null;
			try
			{

				var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]));
				var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
				var claims = new[]
				{
					new Claim(ClaimTypes.NameIdentifier, user.UserName),
					new Claim(ClaimTypes.Role, user.Role.ToString()),
					new Claim(ClaimTypes.Name, user.DisplayName),
					//new Claim(ClaimTypes.SerialNumber, user.IdNumber),
				};
				token = new JwtSecurityToken(configuration["Jwt:Issuer"],
				   configuration["Jwt:Audience"],
				   claims,
				   expires: DateTime.Now.AddMinutes(15),
				   signingCredentials: credentials);

				logger.LogInfo(className, "GenerateJSONWebToken", "END", JsonConvert.SerializeObject(user));
			}
			catch (Exception e)
			{

				logger.LogError(className, "GenerateJSONWebToken", "ERROR", JsonConvert.SerializeObject(user), e);

			}
			return new JwtSecurityTokenHandler().WriteToken(token);

		}


		private BaseViewModel<User> Get_LoggedOnUserData(LoginCommand query)
		{
			BaseViewModel<User> res = new();

			try
			{
				logger.LogInfo(className, "Get_LoggedOnUserData", "START", JsonConvert.SerializeObject(query));
				User User;

				AuthenticationType = configuration["Login:AuthenticationType"];

				switch (AuthenticationType.ToUpper())
				{

					case "NTLM":
						return GetUser(query);
					case "TEST":
						//default for develop and testing
						User = new User()
						{
							UserName = configuration["Login:UserName"],
							Role = int.Parse(configuration["Login:Role"]),
							DisplayName = configuration["Login:DisplayName"],
							IdNumber = configuration["Login:IdNumber"]
						};

						break;
					default:
						throw new HttpRequestException(string.Format("unknown authentication type {0}", AuthenticationType));
				}
				res.Details = User;
				logger.LogInfo(className, "Get_LoggedOnUserData", "END", JsonConvert.SerializeObject(res));

			}
			catch (Exception e)
			{
				res.Messages.Add(new Message
				{
					LogLevel = LogLevel.Error,
					Text = e.Message
				});
				logger.LogError(className, "Get_LoggedOnUserData", e.Message, JsonConvert.SerializeObject(query), e);

			}


			return res;
		}

		private BaseViewModel<User> GetUser(LoginCommand c)
		{
			BaseViewModel<User> res = new BaseViewModel<User>();

			try
			{
				logger.LogInfo(className, "GetUser", "START", JsonConvert.SerializeObject(c));

				userName = HttpContext?.User?.Identity?.Name;

				UserForLoginModel model = new UserForLoginModel()
				{
					UserName = userName
				};
				var url = baseUrl + "/api/User";
				var JsonRes = this.httpClient.PostDirectJson(model, url).GetAwaiter().GetResult();
				JObject obj = JsonConvert.DeserializeObject<JObject>(JsonRes);
				User user = JsonConvert.DeserializeObject<User>(obj.GetValue("Details").ToString());

				res.Details = user;
				logger.LogInfo(className, "GetUser", "END", JsonConvert.SerializeObject(c), JsonConvert.SerializeObject(res));
			}
			catch (Exception e)
			{
				res.Messages.Add(new Message
				{
					LogLevel = LogLevel.Error,
					Text = e.Message
				});
				logger.LogError(className, "GetUser", "ERROR", JsonConvert.SerializeObject(c), e);

			}

			return res;


		}

	}



}

