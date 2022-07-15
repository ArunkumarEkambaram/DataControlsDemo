using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace EClerx.ASPNET.Day20
{
    public partial class FrmAddNewProduct : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlCommand cmd = null;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Request.QueryString["Theme"] != null)
            {
                var theme = Request.QueryString["Theme"] as String;
                Page.Theme = theme;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["EClerxCon"].ConnectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("Select * from Categories", con))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        DdlCategories.DataSource = dt;
                        DdlCategories.DataValueField = "Id";
                        DdlCategories.DataTextField = "Name";
                        DdlCategories.DataBind();
                    }
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["EClerxCon"].ConnectionString))
            {
                using (cmd = new SqlCommand("usp_AddNewProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductName", TxtProductName.Text);
                    cmd.Parameters.AddWithValue("@Description", TxtDescription.Text);
                    cmd.Parameters.AddWithValue("@Price", TxtPrice.Text);
                    cmd.Parameters.AddWithValue("@Quantity", TxtQuantity.Text);
                    cmd.Parameters.AddWithValue("@CategoryId", DdlCategories.SelectedValue);

                    if (ImgFileUpload.HasFile)
                    {
                        string fileName = ImgFileUpload.PostedFile.FileName;
                        string extn = ImgFileUpload.PostedFile.ContentType;
                        if (extn == @"image/jpeg" || extn == @"image/png")
                        {
                            cmd.Parameters.AddWithValue("@ImageFileName", fileName);
                            cmd.Parameters.AddWithValue("@ImagePath", Path.Combine(@"~\Content\Images\", fileName));
                            ImgFileUpload.PostedFile.SaveAs(Server.MapPath(Path.Combine(@"~\Content\Images\", fileName)));
                        }
                        else
                        {
                            lblMessage.Text = "Kindly upload an image";
                        }
                    }

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    cmd.ExecuteNonQuery();
                    this.ClearAll();
                }
            }
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            this.ClearAll();
        }

        public void ClearAll()
        {
            TxtProductName.Text = "";
            TxtDescription.Text = "";
            TxtPrice.Text = "";
            TxtQuantity.Text = "";
            TxtProductName.Focus();
        }

        protected void DdlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("FrmAddNewProduct.aspx?Theme=" + DdlTheme.SelectedItem.ToString());
        }
    }
}