using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(DemoSite.Startup))]
namespace DemoSite {

    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}