using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DrugCompare.Startup))]
namespace DrugCompare
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
