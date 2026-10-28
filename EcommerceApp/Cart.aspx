<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EcommerceApp.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cart</title>

    <link href="Style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 30px;
        }
       
#Label1 {
    display: block;
    font-size: 28px;
    font-weight: bold;
    color: #173b57;
    margin: 20px 0;
}
table {
    width: 100%;
    border-collapse: collapse;
    background-color: white;
    margin-top: 20px;
}

th {
    background-color: #173b57;
    color: white;
    padding: 12px;
}

td {
    padding: 12px;
    border: 1px solid #ddd;
}
input[type="submit"] {
    background-color: #176b87;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #104d63;
}
#Button1 {
    background-color: #6c757d;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
}

#Button1:hover {
    background-color: #495057;
}

#Button2 {
    background-color: #198754;
    color: white;
    border: none;
    padding: 10px 24px;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    margin-left: 10px;
}

#Button2:hover {
    background-color: #146c43;
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
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="My Shoping Cart"></asp:Label>
                    </td>
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
                    <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CartItemId" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">                           
                                <Columns>
                                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Remove" />
                                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                                <asp:BoundField DataField="Price" HeaderText="Price" />
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                    <asp:TextBox ID="txtQuantity" runat="server"
                                     Text='<%# Eval("Quantity") %>' Width="50px"></asp:TextBox>
                                  </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update">
                                 <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server"
                                         Text="Update"
                                         CommandName="UpdateQuantity"
                                         CommandArgument ='<%# Eval("CartItemId") %>' />
                                 </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Total Amount : 0.00"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="Continue Shopping" OnClick="Button1_Click" />
                    </td>
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
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Checkout" OnClick="Button2_Click" />
                    </td>
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
