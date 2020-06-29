using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Moms_food.Startup))]
namespace Moms_food
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
