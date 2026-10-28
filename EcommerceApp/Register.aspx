<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EcommerceApp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create an Account</title>

    <link href="Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 30px;
        }
        body {
    background-color: #f4f6f9;
    font-family: Arial, sans-serif;
}

.register-box {
    max-width: 450px;
    margin: 35px auto;
    padding: 30px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.register-box h2 {
    text-align: center;
    color: #173b57;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 16px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
    color: #333;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

#Button1 {
    width: 100%;
    padding: 12px;
    background-color: #176b87;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
}

#Button1:hover {
    background-color: #104d63;
}

.message {
    margin-top: 15px;
    text-align: center;
}
    </style>
</head>
<body>
     <form id="form1" runat="server">

        <div class="register-box">

            <h2>Create an Account</h2>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter full name"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Email" placeholder="Enter email"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Phone Number"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Phone" placeholder="Enter phone number"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" placeholder="Enter address"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="TextBox7" runat="server" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
            </div>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />

            <div class="message">
                <asp:Label ID="Label9" runat="server"></asp:Label>
            </div>

        </div>

    </form>
</body>
</html>
