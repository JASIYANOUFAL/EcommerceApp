using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EcommerceApp
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadWishlist();
            }
        }

        private void LoadWishlist()
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings["EcommerceDBConnection"].ConnectionString;

            string query = @"
                SELECT p.ProductName, p.Description, p.Price, p.Stock
                FROM Wishlist w
                INNER JOIN WishlistItems wi ON w.WishlistId = wi.WishlistId
                INNER JOIN Products p ON wi.ProductId = p.ProductId
                WHERE w.UserId = @UserId";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value =
                    Convert.ToInt32(Session["UserId"]);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }

}
    
