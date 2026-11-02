<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EcommerceApp.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cart</title>

    <link href="Style.css" rel="stylesheet" type="text/css" />
<style>
     .cart-container {
        margin: 20px;
    }

    .cart-title {
        color: #173b57;
        font-size: 28px;
        font-weight: bold;
    }

    .cart-grid {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    .cart-grid th {
        background-color: #173b57;
        color: white;
        padding: 10px;
    }

    .cart-grid td {
        padding: 10px;
        border: 1px solid #ddd;
    }

    .cart-product-image {
        width: 85px;
        height: 85px;
    }

    .cart-total {
        margin-top: 20px;
        font-size: 20px;
        font-weight: bold;
    }

    .cart-actions {
        margin-top: 20px;
    }

    #Button1,
    #Button2 {
        padding: 10px 20px;
        color: white;
        border: none;
        cursor: pointer;
    }

    #Button1 {
        background-color: #6c757d;
    }

    #Button2 {
        background-color: #198754;
        margin-left: 10px;
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
</div>
        <div class="cart-container">
    <asp:Label ID="Label1" runat="server"
        Text="My Shopping Cart"
        CssClass="cart-title"></asp:Label>

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="CartItemId,ProductId"
        OnRowDeleting="GridView1_RowDeleting"
        OnRowCommand="GridView1_RowCommand"
        CssClass="cart-grid"
        GridLines="None">

        <Columns>
            <asp:TemplateField HeaderText="Select">
    <ItemTemplate>
        <asp:CheckBox ID="chkSelect" runat="server" />
    </ItemTemplate>
</asp:TemplateField>
            <asp:ButtonField ButtonType="Button"
                CommandName="Delete"
                Text="Remove" />

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server"
                        ImageUrl='<%# Eval("ImageUrl") %>'
                        AlternateText='<%# Eval("ProductName") %>'
                        CssClass="cart-product-image" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" />

            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server"
                        Text='<%# Eval("Quantity") %>'
                        Width="50px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

           
        </Columns>
    </asp:GridView>

    <div class="cart-total">
        <asp:Label ID="Label2" runat="server"
            Text="Total Amount : 0.00"></asp:Label>
    </div>

    <div class="cart-actions">
        <asp:Button ID="Button1" runat="server"
            Text="Continue Shopping"
            OnClick="Button1_Click" />

        <asp:Button ID="Button2" runat="server"
            Text="Checkout"
            OnClick="Button2_Click" />
    </div>
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
