using Asp.NetClassses.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp.NetClassses
{
    public partial class Login : System.Web.UI.Page
    {
        TestEntities db = new TestEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                var user = db.Users.Where(x => x.UserId == txtBoxUserId.Text.Trim()).FirstOrDefault();
                if (user != null)
                {
                    var checkPassword = (user.Password == txtBoxPasword.Text.Trim());
                    if(checkPassword)
                    {
                        Session["User"] = user.UserId;
                        Session["UserName"] = user.FullName;
                        Response.Redirect("Default.aspx");
                        //or
                      //  Server.Transfer("GridCrud.aspx");
                    }
                    else
                    {
                        Label4.Text = "Incorrect Password";
                    }
                }
                else
                {
                    Label4.Text = "User does not exist.Kindly Register !";
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}