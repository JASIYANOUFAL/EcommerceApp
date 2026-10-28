using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fullName = TextBox1.Text;
            string userName = TextBox2.Text;
            string email = TextBox3.Text;
            string phone = TextBox4.Text;
            string address = TextBox5.Text;
            string password = TextBox6.Text;
            string confirmPassword = TextBox7.Text;
            if (password != confirmPassword)
            {
                Response.Write("Passwords do not match!");
                return;
            }
            DBConnection db = new DBConnection();
            string query = "INSERT INTO Users (UserName, PasswordHash, Email, Role, FullName, PhoneNumber, Address) VALUES ('"
                + userName + "', '" + password + "', '" + email
                + "', 'Customer', '" + fullName + "', '" + phone
                + "', '" + address + "')";
            int result = db.executeNonQuery(query);
            if (result > 0)
            {
                Label9.Text = "Registration successful!";
               Label9.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Response.Write("Registration failed!");
            }
        }
    }
}