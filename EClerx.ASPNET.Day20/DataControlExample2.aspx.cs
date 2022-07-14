using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EClerx.ASPNET.Day20
{
    public partial class DataControlExample2 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
                {
                    using (adapter = new SqlDataAdapter("Select distinct cCity from Employee", con))
                    {
                        ds = new DataSet();
                        adapter.Fill(ds, "EmployeeCities");
                        DataTable dt = ds.Tables["EmployeeCities"];
                        DdlCity.DataSource = dt;
                        DdlCity.DataTextField = "cCity";
                        DdlCity.DataValueField = "cCity";
                        DdlCity.DataBind();
                    }
                }
            }
        }

        public void BindGrid()
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("Select cEmployeeCode, vFirstName, cCity from Employee Where cCity=@City", con))
                {
                    adapter.SelectCommand.Parameters.AddWithValue("@City", DdlCity.SelectedValue);

                    ds = new DataSet();
                    adapter.Fill(ds, "Employee");

                    GridEmployee.DataSource = ds.Tables["Employee"]; //Get the Datasource and information
                    GridEmployee.DataBind();//Binds the data from datasource to control
                }
            }
        }

        protected void btnGetData_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }
    }
}