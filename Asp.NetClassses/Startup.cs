using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Asp.NetClassses.Startup))]
namespace Asp.NetClassses
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
