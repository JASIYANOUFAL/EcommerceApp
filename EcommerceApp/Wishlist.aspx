<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="EcommerceApp.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Wishlist</title>
    <link href="Style.css" rel="stylesheet" type="text/css" />
    <style>
        .wishlist-box {
            max-width: 1100px;
            margin: 30px auto;
            padding: 25px;
            background-color: white;
            border-radius: 10px;
        }

        .wishlist-title {
            color: #173b57;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .empty-message {
            text-align: center;
            padding: 35px;
            color: #666;
            font-size: 18px;
        }

        .shop-button {
            display: inline-block;
            background-color: #176b87;
            color: white;
            padding: 10px 18px;
            border-radius: 5px;
            text-decoration: none;
            
        }
         .cart-button {
            display: inline-block;
            background-color: #176b87;
            color: white;
            padding: 10px 18px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
        }

        .wishlist-product-image {
    width: 85px;
    height: 85px;
    object-fit: cover;
    border-radius: 8px;
}

        .products-footer {
    margin-top: 40px;
    padding: 22px;
    color: white;
    background: #173b57;
    text-align: center;
}

.products-footer p {
    margin: 5px 0;
}

.products-footer a {
    color: white;
    text-decoration: none;
    margin: 0 8px;
}

.products-footer a:hover {
    text-decoration: underline;
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

        <div class="wishlist-box">
            <div class="wishlist-title">My Wishlist</div>

            <asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="ProductId"
    EmptyDataText="Your wishlist is empty."
    Width="100%">
    <Columns>
        <asp:TemplateField HeaderText="Select">
    <ItemTemplate>
        <asp:CheckBox ID="chkSelect" runat="server" />
    </ItemTemplate>
</asp:TemplateField>
        <asp:TemplateField HeaderText="Image">
    <ItemTemplate>
        <asp:Image ID="imgProduct" runat="server"
            ImageUrl='<%# Eval("ImageUrl") %>'
            AlternateText='<%# Eval("ProductName") %>'
            CssClass="wishlist-product-image" />
    </ItemTemplate>
</asp:TemplateField>
        <asp:BoundField DataField="ProductName"
            HeaderText="Product Name" />
        <asp:BoundField DataField="Description"
            HeaderText="Description" />
        <asp:BoundField DataField="Price"
            HeaderText="Price"
            DataFormatString="{0:N2}" />
        <asp:BoundField DataField="Stock"
            HeaderText="Available Stock" />
    </Columns>
</asp:GridView>

<br />

<a href="Products.aspx" class="shop-button">
    Continue Shopping
</a>
<br />
           <asp:Button ID="btnAddToCart" runat="server"
    Text="Add To Cart"
    CssClass="cart-button"
    OnClick="btnAddToCart_Click" />

        </div>

        <footer class="products-footer">
    <p>&copy; 2026 My E-Commerce Store. All rights reserved.</p>
    <p>
        <a href="Default.aspx">Home</a> |
        <a href="Products.aspx">Products</a> |
        <a href="Cart.aspx">My Cart</a> |
        <a href="Wishlist.aspx">My Wishlist</a>
    </p>
</footer>

    </form>
</body>
</html>
