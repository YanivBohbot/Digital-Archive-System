using Castle.MicroKernel.Registration;
using Castle.MicroKernel.Resolvers.SpecializedResolvers;
using Castle.Windsor;
using Castle.Windsor.Installer;
using Castle.Windsor.MsDependencyInjection;
using iRoads.DigitalArchive.DataAccess.Networking;
using iRoads.DigitalArchive.Mapper;
using iRoads.DigitalArchive.Web.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Ness.Framework.Core.Interfaces.Log;
using Ness.Framework.Core.Utils;
using Ness.Framework.Core.WebApi.Filters;
using Ness.Framework.Logger;
using System.Net;
using ILogger = Ness.Framework.Core.Interfaces.Log.ILogger;
using Newtonsoft.Json.Serialization;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using iRoads.DigitalArchive.Web.Filters;
using Microsoft.IdentityModel.Logging;

namespace iRoads.DigitalArchive.Web
{
    public class Startup
    {
        private static IWindsorContainer _container;
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }


        // This method gets called by the runtime. Use this method to add services to the container.
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            IdentityModelEventSource.ShowPII = true;

            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            services.AddSingleton<IConfiguration>(Configuration);


            services.AddSingleton<ILogger, FileLogger>();
            services.AddSingleton<INetworkHttpClient, NetworkHttpClient>();
            services.AddMvc(options =>
            {
                options.EnableEndpointRouting = false;
                options.Filters.Add<iRoads.DigitalArchive.Web.Filters.APISetUserFilterAttribute>();
                //options.Filters.Add<APIValidationAttribute>();
            }).AddNewtonsoftJson(op => op.SerializerSettings.ContractResolver = new DefaultContractResolver());

            // Adds a default in-memory implementation of IDistributedCache.
            //services.AddDistributedMemoryCache();
            //services.AddMemoryCache();
            //services.AddSession(options =>
            //{
            //    // Set a short timeout for easy testing.
            //    options.IdleTimeout = TimeSpan.FromMinutes(20);
            //    options.Cookie.Name = ".iRodes.Session";
            //    options.Cookie.HttpOnly = true;
            //});
            //services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
            //    .AddCookie(options =>
            //    {
            //        options.Events.OnRedirectToLogin = (ctx) =>
            //        {
            //            if (ctx.Request.Path.StartsWithSegments("/api") &&
            //                ctx.Response.StatusCode == (int)HttpStatusCode.OK)
            //            {
            //                ctx.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
            //            }
            //            else
            //            {
            //                ctx.Response.Redirect(ctx.RedirectUri);
            //            }
            //            return Task.FromResult(0);
            //        };


            //    });

            services.AddCors(options =>
            {
                options.AddPolicy("AllowOrigin",
                                  policy =>
                                  {

                                      policy.AllowAnyOrigin()
                                      .AllowAnyHeader()
                                      .AllowAnyMethod().SetIsOriginAllowedToAllowWildcardSubdomains().Build();
                                  });
            });

            services.AddAuthorization(options =>
            {
                options.AddPolicy("JWT_Policy", policy => policy.Requirements.Add(new AuthorizedAttribute()));
                //options.FallbackPolicy = options.DefaultPolicy;
            });

            services.AddAuthentication(option =>
            {
                option.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                option.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = false,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Configuration["Jwt:Issuer"],
                    ValidAudience = Configuration["Jwt:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"])) 
                };
            });
            services.AddAutoMapper(c =>
            {
                c.AddProfile(new ViewModelToDomainMappingProfile());
                c.AddProfile(new DomainToViewModelMappingProfile());
            });
            services.AddTransient<IAuthorizationHandler, APIAuthorizeHandler>();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "IRoads_API",
                    Version = "v1"
                });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 1safsfsdfdfd\"",
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement {
                {
                    new OpenApiSecurityScheme {
                        Reference = new OpenApiReference {
                            Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                        }
                    },
                    new string[] {}
                }
            });
            });
            _container = new WindsorContainer();

            IConfigurationRoot configRoot = new ConfigurationBuilder().AddJsonFile($"appsettings.json").Build();
            _container.Register(Component.For<IConfiguration>().Instance(configRoot));

            try
            {
                //_container.Install(FromAssembly.Named("iRoads.DigitalArchive.Web"));
                _container.Install(FromAssembly.Named("iRoads.DigitalArchive.Services.Bootstrapper"));
                _container.Install(FromAssembly.Named("iRoads.DigitalArchive.BusinessLogic.Bootstrapper"));
            }
            catch (Exception e)
            {
                var s = e;
            }
            _container.Kernel.Resolver.AddSubResolver(new CollectionResolver(_container.Kernel, true));
            return WindsorRegistrationHelper.CreateServiceProvider(_container, services);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {

            app.Use(async (context, next) =>
            {
                await next();
                if (context.Response.StatusCode == 404 &&
                   !Path.HasExtension(context.Request.Path.Value) &&
                   !string.IsNullOrEmpty(context.Request.Path.Value) &&
                   !context.Request.Path.Value.StartsWith("/api/"))
                {
                    context.Request.Path = "/index.html";
                    await next();
                }
            });
            //app.UseSession();
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Contacts API V1");
            });
            app.UseMiddleware(typeof(ErrorHandlingMiddleware));
            CacheHelper.Configure();

            app.UseStaticHttpContext();
            app.UseMvcWithDefaultRoute();
            app.UseDefaultFiles();
            app.UseStaticFiles();

            app.UseCors("AllowOrigin");

            app.UseAuthentication();
            app.UseAuthorization();

            

        }
    }
}
