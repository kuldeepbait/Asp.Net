using Asp.NetClassses.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp.NetClassses
{
    public partial class Registration : System.Web.UI.Page
    {
        TestEntities db = new TestEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                User userObject = new User();
                userObject.FullName = txtUserName.Text;
                userObject.UserId = txtBoxUserId.Text;
                userObject.Password = txtBoxPasword.Text;
                userObject.Email = txtEmail.Text;
                db.Users.Add(userObject);
                db.SaveChanges();
                Label4.Text = "User Registered !";
                btnLogin.Visible = true;
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}