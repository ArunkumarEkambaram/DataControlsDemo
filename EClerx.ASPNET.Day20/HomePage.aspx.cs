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
    public partial class HomePage : System.Web.UI.Page
    {
        private SqlConnection con = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["EClerxCon"].ConnectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("Select ProductName, Price, ImagePath from Product", con))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        dlProducts.DataSource = dt;
                        dlProducts.DataBind();
                    }
                }
            }
        }
    }
}