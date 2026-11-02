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
    SELECT p.ProductId, p.ImageUrl, p.ProductName,
           p.Description, p.Price, p.Stock
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
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);

            string connectionString =
                ConfigurationManager.ConnectionStrings["EcommerceDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                

                int cartId;

                string findCartQuery =
                    "SELECT CartId FROM Cart WHERE UserId = @UserId";

                using (SqlCommand cmd = new SqlCommand(findCartQuery, con))
                {
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;

                    object result = cmd.ExecuteScalar();

                    if (result == null)
                    {
                        
                        string createCartQuery = @"
                    INSERT INTO Cart (UserId, CreatedDate)
                    VALUES (@UserId, GETDATE());
                    SELECT CAST(SCOPE_IDENTITY() AS INT);";

                        using (SqlCommand createCmd =
                               new SqlCommand(createCartQuery, con))
                        {
                            createCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                            cartId = Convert.ToInt32(createCmd.ExecuteScalar());
                        }
                    }
                    else
                    {
                        cartId = Convert.ToInt32(result);
                    }
                }

                
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox chk = (CheckBox)row.FindControl("chkSelect");

                    if (chk != null && chk.Checked)
                    {
                        int productId =
                            Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

                        string itemQuery = @"
                    IF EXISTS (
                        SELECT 1 FROM CartItems
                        WHERE CartId = @CartId AND ProductId = @ProductId
                    )
                        UPDATE CartItems
                        SET Quantity = Quantity + 1
                        WHERE CartId = @CartId AND ProductId = @ProductId
                    ELSE
                        INSERT INTO CartItems (CartId, ProductId, Quantity)
                        VALUES (@CartId, @ProductId, 1);";

                        using (SqlCommand itemCmd = new SqlCommand(itemQuery, con))
                        {
                            itemCmd.Parameters.Add("@CartId", SqlDbType.Int).Value = cartId;
                            itemCmd.Parameters.Add("@ProductId", SqlDbType.Int).Value = productId;
                            itemCmd.ExecuteNonQuery();
                            string deleteQuery = @"
    DELETE wi
    FROM WishlistItems wi
    INNER JOIN Wishlist w ON wi.WishlistId = w.WishlistId
    WHERE w.UserId = @UserId
      AND wi.ProductId = @ProductId";

                            using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con))
                            {
                                deleteCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                                deleteCmd.Parameters.Add("@ProductId", SqlDbType.Int).Value = productId;
                                deleteCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }

            Response.Redirect("Cart.aspx");
        }
    }

}
    
