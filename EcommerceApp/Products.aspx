<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="EcommerceApp.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Our E-Commerce Store</title>
    <link href="Style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        #Label4 {
    display: block;
    font-size: 28px;
    font-weight: bold;
    color: #173b57;
    margin-bottom: 20px;

   
}
         #Label6 {
    font-size: 18px;
    font-weight: bold;
    color: #176b87;
}
        

#Button1 {
    background-color: #176b87;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

#Button1:hover {
    background-color: #104d63;

}
 
 
#Label5 {
    font-size: 16px;
    font-weight: bold;
    color: #173b57;
    padding-right: 10px;
}

#ddlCategories {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    min-width: 180px;
    background-color: white;
}

#GridView1 {
    width: 100%;
    border-collapse: collapse;
    background-color: white;
    margin-top: 20px;
}

#GridView1 th {
    background-color: #173b57;
    color: white;
    padding: 12px;
    text-align: left;
}

#GridView1 td {
    padding: 12px;
    border: 1px solid #ddd;
}

#GridView1 tr:nth-child(even) {
    background-color: #f2f6f8;
}

#GridView1 input[type="submit"],
#GridView1 input[type="button"] {
    background-color: #176b87;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    margin: 3px;
}

#GridView1 input[type="submit"]:hover,
#GridView1 input[type="button"]:hover {
    background-color: #104d63;
}
#Button2 {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 9px 18px;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
}

#Button2:hover {
    background-color: #b02a37;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div class="header">
        <h1>My E-Commerce Store</h1>
        <p>Shop Smart. Shop Easy.</p>
    </div>

    <div class="navbar">
        <a href="Products.aspx">Home / Products</a>
        <a href="Cart.aspx">My Cart</a>
        <a href="Wishlist.aspx">My Wishlist</a>
    </div>

    <div class="container">
        <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Welcome!"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Logout" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2">
                        
                        <asp:Label ID="Label4" runat="server" Text="Our Products"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCategories" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        
<asp:GridView ID="GridView1" runat="server" DataKeyNames="ProductId" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:ButtonField CommandName="AddToCart" Text="Add to Cart" />
        <asp:ButtonField CommandName="AddToWishlist" Text="Add to Wishlist" />
    </Columns>
</asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
