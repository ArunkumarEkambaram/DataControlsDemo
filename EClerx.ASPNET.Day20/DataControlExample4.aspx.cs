using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EClerx.ASPNET.Day20
{
    public partial class DataControlExample4 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["EClerxCon"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("Select ProductName, Price, ImagePath from Product", con))
                {                    
                    adapter.Fill(ds, "Product1");
                    DlProducts.DataSource = ds.Tables["Product1"];
                    DlProducts.DataBind();
                }

                using(adapter=new SqlDataAdapter("Select ProductName, Description, Price from Product", con))
                {
                    adapter.Fill(ds, "Product2");
                    Repeater1.DataSource = ds.Tables["Product2"];
                    Repeater1.DataBind();
                }
            }
        }
    }
}