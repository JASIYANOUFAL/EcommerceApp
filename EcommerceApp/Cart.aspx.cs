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

            string query =
     "SELECT CartItems.CartItemId, CartItems.ProductId, " +
     "Products.ProductName, Products.ImageUrl, Products.Price, " +
     "CartItems.Quantity, " +
     "(Products.Price * CartItems.Quantity) AS Total " +
     "FROM Cart " +
     "INNER JOIN CartItems ON Cart.CartId = CartItems.CartId " +
     "INNER JOIN Products ON CartItems.ProductId = Products.ProductId " +
     "WHERE Cart.UserId = " + userId;

            DataTable cartData = db.executeDataTable(query);

            GridView1.DataSource = cartData;
            GridView1.DataBind();

            decimal totalAmount = 0;

            foreach (DataRow item in cartData.Rows)
            {
                if (item["Total"] != DBNull.Value)
                {
                    totalAmount += Convert.ToDecimal(item["Total"]);
                }
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
            System.Collections.Generic.List<int> selectedIds =
                new System.Collections.Generic.List<int>();

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox chk =
                    (System.Web.UI.WebControls.CheckBox)
                    GridView1.Rows[i].FindControl("chkSelect");

                if (chk != null && chk.Checked)
                {
                    selectedIds.Add(
                        Convert.ToInt32(GridView1.DataKeys[i].Values["CartItemId"]));
                }
            }

            if (selectedIds.Count == 0)
            {
                Response.Write("Please select at least one product to checkout.");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            string selectedIdList =
                string.Join(",", selectedIds.ConvertAll(id => id.ToString()).ToArray());

            DBConnection db = new DBConnection();

            string itemsQuery =
                "SELECT CartItems.ProductId, CartItems.Quantity, Products.Price " +
                "FROM Cart " +
                "INNER JOIN CartItems ON Cart.CartId = CartItems.CartId " +
                "INNER JOIN Products ON CartItems.ProductId = Products.ProductId " +
                "WHERE Cart.UserId = " + userId +
                " AND CartItems.CartItemId IN (" + selectedIdList + ")";

            DataTable dt = db.executeDataTable(itemsQuery);

            decimal totalAmount = 0;

            foreach (DataRow row in dt.Rows)
            {
                totalAmount += Convert.ToDecimal(row["Price"]) *
                               Convert.ToInt32(row["Quantity"]);
            }

            string totalSql =
                totalAmount.ToString(
                    System.Globalization.CultureInfo.InvariantCulture);

            string orderQuery =
                "INSERT INTO Orders (UserId, OrderDate, TotalAmount, OrderStatus) " +
                "VALUES (" + userId + ", GETDATE(), " + totalSql +
                ", 'Pending'); SELECT SCOPE_IDENTITY();";

            string orderId = db.executeScalar(orderQuery);

            string paymentQuery =
                "INSERT INTO Payments (OrderId, PaymentMethod, Amount, " +
                "PaymentStatus, PaymentDate) VALUES (" +
                orderId + ", 'COD', " + totalSql + ", 'Pending', GETDATE())";

            db.executeNonQuery(paymentQuery);

            foreach (DataRow row in dt.Rows)
            {
                int productId = Convert.ToInt32(row["ProductId"]);
                int quantity = Convert.ToInt32(row["Quantity"]);
                string price = Convert.ToDecimal(row["Price"]).ToString(
                    System.Globalization.CultureInfo.InvariantCulture);

                string insertItemQuery =
                    "INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice) " +
                    "VALUES (" + orderId + ", " + productId + ", " +
                    quantity + ", " + price + ")";

                db.executeNonQuery(insertItemQuery);
            }

            string deleteQuery =
                "DELETE FROM CartItems WHERE CartItemId IN (" + selectedIdList + ") " +
                "AND CartId IN (SELECT CartId FROM Cart WHERE UserId = " + userId + ")";

            db.executeNonQuery(deleteQuery);

            Response.Redirect("OrderSuccess.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
    }
}
