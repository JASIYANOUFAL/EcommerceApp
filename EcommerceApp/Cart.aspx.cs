using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EcommerceApp
{
    public partial class Cart : System.Web.UI.Page
    {
        private void LoadCart()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            DBConnection db = new DBConnection();

            string query = "SELECT CartItems.CartItemId, Products.ProductName, Products.Price, " +
                "CartItems.Quantity, " +
                "(Products.Price * CartItems.Quantity) AS Total " +
                "FROM Cart " +
                "INNER JOIN CartItems ON Cart.CartId = CartItems.CartId " +
                "INNER JOIN Products ON CartItems.ProductId = Products.ProductId " +
                "WHERE Cart.UserId = " + userId;

            GridView1.DataSource = db.executeDataTable(query);
            GridView1.DataBind();
            decimal totalAmount = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                decimal price = Convert.ToDecimal(row.Cells[2].Text);

                TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
                int quantity = Convert.ToInt32(txtQuantity.Text);

                totalAmount += price * quantity;
            }

            Label2.Text = "Total Amount: Rs. " + totalAmount.ToString("0.00");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCart();
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;

            int cartItemId = Convert.ToInt32(
            GridView1.DataKeys[rowIndex].Value);

            DBConnection db = new DBConnection();

            string query =
            "DELETE FROM CartItems WHERE CartItemId = " + cartItemId;

            db.executeNonQuery(query);

            LoadCart();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateQuantity")
            {
                int cartItemId = Convert.ToInt32(e.CommandArgument);

                Button btn = (Button)e.CommandSource;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
                int quantity = Convert.ToInt32(txtQuantity.Text);

                if (quantity <= 0)
                {
                    Response.Write("Quantity must be greater than zero.");
                    return;
                }

                DBConnection db = new DBConnection();

                string query = "UPDATE CartItems SET Quantity = " + quantity +
                               " WHERE CartItemId = " + cartItemId;

                db.executeNonQuery(query);

                LoadCart();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            DBConnection db = new DBConnection();

            string totalQuery =
            "SELECT SUM(Products.Price* CartItems.Quantity)" +
"FROM Cart " +
"INNER JOIN CartItems ON Cart.CartId = CartItems.CartId " +
"INNER JOIN Products ON CartItems.ProductId = Products.ProductId " +
"WHERE Cart.UserId = " + userId;

            string totalResult = db.executeScalar(totalQuery);

            if (string.IsNullOrEmpty(totalResult))
            {
                Response.Write("Your cart is empty.");
                return;
            }

            decimal totalAmount = Convert.ToDecimal(totalResult);
            string orderQuery =
    "INSERT INTO Orders (UserId, OrderDate, TotalAmount, OrderStatus) " +
    "VALUES (" + userId + ", GETDATE(), " + totalAmount + ", 'Pending'); " +
    "SELECT SCOPE_IDENTITY();";

            string orderId = db.executeScalar(orderQuery);
            string paymentQuery =
    "INSERT INTO Payments (OrderId, PaymentMethod, Amount, PaymentStatus, PaymentDate) " +
    "VALUES (" + orderId + ", 'COD', " + totalAmount +
    ", 'Pending', GETDATE())";

            db.executeNonQuery(paymentQuery);


            string itemsQuery =
    "SELECT CartItems.ProductId, CartItems.Quantity, Products.Price " +
    "FROM Cart " +
    "INNER JOIN CartItems ON Cart.CartId = CartItems.CartId " +
    "INNER JOIN Products ON CartItems.ProductId = Products.ProductId " +
    "WHERE Cart.UserId = " + userId;

            DataTable dt = db.executeDataTable(itemsQuery);

            foreach (DataRow row in dt.Rows)
            {
                int productId = Convert.ToInt32(row["ProductId"]);
                int quantity = Convert.ToInt32(row["Quantity"]);
                decimal price = Convert.ToDecimal(row["Price"]);

                string insertItemQuery =
                    "INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice) " +
                    "VALUES (" + orderId + ", " + productId + ", " +
                    quantity + ", " + price + ")";

                db.executeNonQuery(insertItemQuery);
            }
            string clearCartQuery =
    "DELETE FROM CartItems WHERE CartId IN " +
    "(SELECT CartId FROM Cart WHERE UserId = " + userId + ")";

            db.executeNonQuery(clearCartQuery);
            Response.Redirect("OrderSuccess.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
    }
}
