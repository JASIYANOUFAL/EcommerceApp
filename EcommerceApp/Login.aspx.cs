using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBConnection db = new DBConnection();
            string userName = TextBox1.Text;
            string password = TextBox2.Text;
            string query = "SELECT UserId FROM Users WHERE UserName = '"
               + userName + "' AND PasswordHash = '" + password + "'";
            string result = db.executeScalar(query);
            if (!string.IsNullOrEmpty(result))
            {
                Session["UserId"] = result;
                Session["UserName"] = userName;
                Response.Redirect("Products.aspx");
            }
            else
            {
                Label4.Text = "Invalid Username or Password!";
                Label4.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}