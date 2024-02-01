using DocumentFormat.OpenXml.Office2016.Drawing.ChartDrawing;
using iRoads.DigitalArchive.IdentificationApp.Helpers;
using Microsoft.AspNetCore.Authentication.Negotiate;
using Microsoft.OpenApi.Models;
using Ness.Framework.Logger;
using Newtonsoft.Json.Serialization;

using ILogger = Ness.Framework.Core.Interfaces.Log.ILogger;

var builder = WebApplication.CreateBuilder(args);

var baseUrl = builder.Configuration.GetSection("BaseUrl").Get<string>();

builder.Services.AddCors(options =>
{
		options.AddDefaultPolicy(
						  policy =>
						  {

								  policy.WithOrigins(baseUrl)
							  .AllowAnyHeader()
							  .AllowAnyMethod().AllowCredentials()
							  .SetIsOriginAllowedToAllowWildcardSubdomains().Build();
						  });
});



// Add services to the container.

builder.Services.AddAuthentication(NegotiateDefaults.AuthenticationScheme)
   .AddNegotiate();

builder.Services.AddAuthorization(options =>
{
		// By default, all incoming requests will be authorized according to the default policy.
		//options.FallbackPolicy = options.DefaultPolicy;
});
builder.Services.AddRazorPages();
builder.Services.AddSingleton<ILogger, FileLogger>();


builder.Services.AddScoped<INetworkHttpClient, NetworkHttpClient>();

builder.Services.AddSwaggerGen(c =>
 {
		 c.SwaggerDoc("v1", new OpenApiInfo
		 {
				 Title = "IRoads_API",
				 Version = "v1"
		 });
 });
builder.Services.AddControllers();
builder.Services.AddHttpContextAccessor();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddMvc().AddNewtonsoftJson(op => op.SerializerSettings.ContractResolver = new DefaultContractResolver());

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseSwagger();
if (!app.Environment.IsDevelopment())
{
		app.UseExceptionHandler("/Error");
		// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
		app.UseHsts();
		app.UseSwaggerUI(c =>
		{
				c.SwaggerEndpoint("/Login/swagger/v1/swagger.json", "iRoads Login API V1");
		});
}
else
{


		app.UseSwaggerUI(c =>
		{
				c.SwaggerEndpoint("/swagger/v1/swagger.json", "iRoads Login API V1");
		});
}





app.UseHttpsRedirection();

app.UseRouting();
app.UseCors();
app.UseStaticFiles();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.MapRazorPages();


app.Run();
