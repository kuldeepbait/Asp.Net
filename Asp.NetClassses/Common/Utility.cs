using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Asp.NetClassses.Common
{
   public class Utility : System.Web.UI.Page
    {
        public  string GetUser()
        {
            return Convert.ToString(Session["User"]);
        }
    }
}
