using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EClerx.ASPNET.Day20
{
    public partial class DataControlExample3 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("Select cEmployeeCode, vFirstName, cCity from Employee", con))
                {
                    ds = new DataSet();
                    adapter.Fill(ds, "Employee");

                    GridEmployee.DataSource = ds.Tables["Employee"]; //Get the Datasource and information
                    GridEmployee.DataBind();//Binds the data from datasource to control
                }
            }
        }

        protected void GridEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridEmployee.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GridEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridEmployee.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void GridEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Update Employee SET vFirstName=@FName, cCity=@City Where cEmployeeCode=@EmpCode", con))
                {
                    //cmd.Parameters.AddWithValue("@City")

                    var firstName = GridEmployee.Rows[e.RowIndex].FindControl("TxtFirstName") as TextBox;
                    var city = GridEmployee.Rows[e.RowIndex].FindControl("TxtCity") as TextBox;
                    var empCode = GridEmployee.Rows[e.RowIndex].FindControl("lblEmpCode") as Label;

                    cmd.Parameters.AddWithValue("@FName", firstName.Text);
                    cmd.Parameters.AddWithValue("@City", city.Text);
                    cmd.Parameters.AddWithValue("@EmpCode", empCode.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridEmployee.EditIndex = -1;
            this.BindGrid();
        }

        protected void GridEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridEmployee.EditIndex = -1;
            this.BindGrid();
        }
    }
}