using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class ProductDetails
    {
        public DataTable GetProducts()
        {
            DataTable dt = null;
            using(SqlConnection con=new SqlConnection(@"Data Source=arun-pc\sqlexpress;Initial Catalog=EClerx;Integrated Security=True"))
            {
                using(SqlDataAdapter cmd=new SqlDataAdapter("Select * from Product", con))
                {
                    dt = new DataTable();
                    cmd.Fill(dt);
                }
            }
            return dt;
        }
    }
}
