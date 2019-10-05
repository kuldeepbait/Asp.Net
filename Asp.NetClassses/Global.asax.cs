using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Asp.NetClassses
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Exception objErr = Server.GetLastError().GetBaseException();
            string err = "Error in: " + Request.Url.ToString() +
                              ". Error Message:" + objErr.Message.ToString();

        }
        void Session_Start(object sender, EventArgs e)
        {

            

            Session.Timeout = 1;

        }

        void Session_End(object sender, EventArgs e)
        {

            

        }
    }
}