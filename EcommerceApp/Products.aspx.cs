using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace EcommerceApp
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Label6.Text = "Welcome, " + Session["UserName"].ToString() + "!";
            }


            if (!IsPostBack)
            {
                DBConnection db = new DBConnection();
                DataTable dt = db.executeDataTable(
                    "SELECT CategoryId, CategoryName FROM Categories"
                );
                ddlCategories.DataSource = dt;
                ddlCategories.DataTextField = "CategoryName";
                ddlCategories.DataValueField = "CategoryId";
                ddlCategories.DataBind();
                ddlCategories.Items.Insert(0,
                    new System.Web.UI.WebControls.ListItem(
                        "-- Select Category --", "0"));
                LoadProducts();
            }
            

        }
        protected void LoadProducts()
        {
            DBConnection db = new DBConnection();
            DataTable dt = db.executeDataTable(
                "SELECT ProductId, ProductName, Price, Stock FROM Products"
            );
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();
            string categoryId = ddlCategories.SelectedValue;
            string query;
            if (categoryId == "0")
            {
                query = "SELECT ProductId, ProductName, Price, Stock FROM Products";
            }
            else
            {
                query = "SELECT ProductId, ProductName, Price, Stock FROM Products WHERE CategoryId = "
                        + categoryId;
            }
            DataTable dt = db.executeDataTable(query);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int productId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
            int userId = Convert.ToInt32(Session["UserId"]);

            DBConnection db = new DBConnection();

            if (e.CommandName == "AddToCart")
            {
                string cartQuery =
                    "SELECT ISNULL((SELECT TOP 1 CartId FROM Cart WHERE UserId = "
                    + userId + "), 0)";

                string cartIdResult = db.executeScalar(cartQuery);

                if (cartIdResult == "0")
                {
                    string createCartQuery =
                        "INSERT INTO Cart (UserId, CreatedDate) VALUES (" +
                        userId + ", GETDATE()); SELECT SCOPE_IDENTITY();";

                    cartIdResult = db.executeScalar(createCartQuery);
                }

                string itemQuery =
                    "INSERT INTO CartItems (CartId, ProductId, Quantity) VALUES (" +
                    cartIdResult + ", " + productId + ", 1)";

                db.executeNonQuery(itemQuery);

                Response.Redirect("Cart.aspx");
            }
            else if (e.CommandName == "AddToWishlist")
            {
                string wishlistQuery =
                    "SELECT ISNULL((SELECT TOP 1 WishlistId FROM Wishlist WHERE UserId = "
                    + userId + "), 0)";

                string wishlistIdResult = db.executeScalar(wishlistQuery);

                if (wishlistIdResult == "0")
                {
                    string createWishlistQuery =
                        "INSERT INTO Wishlist (UserId, CreatedDate) VALUES (" +
                        userId + ", GETDATE()); SELECT SCOPE_IDENTITY();";

                    wishlistIdResult = db.executeScalar(createWishlistQuery);
                }

                string checkQuery =
                    "SELECT COUNT(*) FROM WishlistItems WHERE WishlistId = " +
                    wishlistIdResult + " AND ProductId = " + productId;

                string itemExists = db.executeScalar(checkQuery);

                if (itemExists == "0")
                {
                    string insertQuery =
                        "INSERT INTO WishlistItems (WishlistId, ProductId, AddedDate) VALUES (" +
                        wishlistIdResult + ", " + productId + ", GETDATE())";

                    db.executeNonQuery(insertQuery);
                }

                Response.Write("Product added to Wishlist!");
            }
        }
    }
}