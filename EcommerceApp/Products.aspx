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

#GridView1 {
    display: block;
    width: 100%;
    background: transparent;
    border-collapse: separate;
}

#GridView1 tbody {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

#GridView1 tr:first-child {
    display: none;
}

#GridView1 tr {
    display: flex;
    flex-direction: column;
    flex: 0 0 220px;
    background: white;
    border: 1px solid #e1e5e9;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

#GridView1 td {
    display: block;
    padding: 8px 14px;
    border: none;
}

#GridView1 td:first-child img {
    width: 100% !important;
    height: 180px !important;
    object-fit: cover;
}

#GridView1 td:nth-child(2) {
    font-size: 18px;
    font-weight: bold;
    color: #173b57;
}

#GridView1 td:nth-child(3) {
    font-size: 13px;
    color: #666;
}

#GridView1 td:nth-child(4) {
    font-size: 17px;
    font-weight: bold;
    color: #176b87;
}

#GridView1 a {
    display: block;
    padding: 9px;
    margin-top: 5px;
    border-radius: 5px;
    background: #176b87;
    color: white;
    text-align: center;
    text-decoration: none;
}

.products-toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
    margin-bottom: 25px;
}

.products-filter {
    display: flex;
    align-items: end;
    gap: 12px;
    flex-wrap: wrap;
    margin: 22px 0;
}

.products-filter-group {
    display: flex;
    flex-direction: column;
    gap: 7px;
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

@media (max-width: 650px) {
    .products-toolbar {
        align-items: flex-start;
        flex-direction: column;
    }

    .products-filter {
        align-items: stretch;
        flex-direction: column;
    }
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
        <a href="Default.aspx">Home</a>
        <a href="Products.aspx">Products</a>
        <a href="Cart.aspx">My Cart</a>
        <a href="Wishlist.aspx">My Wishlist</a>
    </div>

   <div class="container">

    <div class="products-toolbar">
        <asp:Label ID="Label6" runat="server" Text="Welcome!"></asp:Label>
        <asp:Button ID="Button2" runat="server"
            OnClick="Button2_Click" Text="Logout" />
    </div>

    <asp:Label ID="Label4" runat="server" Text="Our Products"></asp:Label>

    <div class="products-filter">
        <div class="products-filter-group">
            <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
            <asp:DropDownList ID="ddlCategories" runat="server">
            </asp:DropDownList>
        </div>

        <asp:Button ID="Button1" runat="server"
            OnClick="Button1_Click" Text="Search" />
    </div>

    <asp:GridView ID="GridView1" runat="server"
        DataKeyNames="ProductId"
        AutoGenerateColumns="False"
        OnRowCommand="GridView1_RowCommand">

        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server"
                        ImageUrl='<%# Eval("ImageUrl") %>'
                        AlternateText='<%# Eval("ProductName") %>'
                        style="width:150px;height:150px;object-fit:cover;" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" />

            <asp:ButtonField CommandName="AddToCart" Text="Add to Cart" />
            <asp:ButtonField CommandName="AddToWishlist" Text="Add to Wishlist" />
        </Columns>
    </asp:GridView>

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
