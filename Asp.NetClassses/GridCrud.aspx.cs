using Asp.NetClassses.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp.NetClassses
{
    public partial class GridCrud : System.Web.UI.Page
    {
        TestEntities db = new TestEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                BindGrid();
                // SetInitialRow();
            }
           
        }

        private void BindGrid()
        {
            var list = (from a in db.Employees
                        join b in db.Cities
                        on a.CityId equals b.Id
                        select new
                        {
                            a.EmpId,
                            a.EmpName,
                            a.EmpSalary,
                            b.Id,
                            b.CityName
                        }).ToList();
            GridView1.DataSource = list;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int empId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            // int empId = Convert.ToInt32(GridView1.Rows[e.RowIndex].data DataKeyNames[""]);
            var eml = db.Employees.Where(em => em.EmpId == empId).FirstOrDefault();
            db.Employees.Remove(eml);
            db.SaveChanges();
            BindGrid();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlCities = (DropDownList)e.Row.FindControl("ddlCities");
                ddlCities.DataSource = db.Cities.ToList();
                ddlCities.DataTextField = "CityName";
                ddlCities.DataValueField = "Id";
                ddlCities.DataBind();
                string selectedCity = DataBinder.Eval(e.Row.DataItem, "CityName").ToString();
                // ddlCities.Items.FindByValue(selectedCity).Selected = true;
                ddlCities.Items.FindByText(selectedCity).Selected = true;
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int empId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            var emp = db.Employees.Where(em => em.EmpId == empId).FirstOrDefault();
            emp.EmpName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtBoxName")).Text;
            emp.EmpSalary = Convert.ToDecimal(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtBoxSalary")).Text);
            db.SaveChanges();
            GridView1.EditIndex = -1;
            ScriptManager.RegisterStartupScript(this,typeof(Page), "Alert","<script>alert('Record has been update successfully!');</script>",false);
            BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                SetInitialRow();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.SelectedIndex = e.RowIndex;
            BindGrid();
        }

        private void SetInitialRow()
        {
            ((TextBox)GridView1.FooterRow.FindControl("txtBoxNameFt")).Text = "";
            //((TextBox)GridView1.FooterRow.FindControl("txtcurrnameft")).Text = "";
            //((TextBox)GridView1.FooterRow.FindControl("txtnonactive")).Text = "";
            btnAdd.Enabled = false;
            btnCancel.Visible = true;
            btnSave.Visible = true;
            GridView1.FooterRow.Visible = true; ;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SetInitialRow();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //((TextBox)GridView1.FooterRow.FindControl("txtBoxNameFt")).Text)
            Employee emp = new Employee();
            emp.EmpName = ((TextBox)GridView1.FooterRow.FindControl("txtBoxNameFt")).Text;
            emp.EmpSalary = Convert.ToDecimal(((TextBox)GridView1.FooterRow.FindControl("txtSalaryFt")).Text);
            emp.CreatedBy = Convert.ToString(Session["User"]);
            emp.CreatedDate = DateTime.Now;
            db.Employees.Add(emp);
            db.SaveChanges();
            GridView1.FooterRow.Visible = false;
            BindGrid();
            Response.Redirect("WebForm1.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}