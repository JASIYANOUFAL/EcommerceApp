<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EcommerceApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        body {
    background-color: #f4f6f9;
    font-family: Arial, sans-serif;
}

.login-box {
    width: 400px;
    margin: 70px auto;
    padding: 30px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

#Label1 {
    display: block;
    font-size: 28px;
    font-weight: bold;
    color: #173b57;
    text-align: center;
    padding: 15px;
}

#Label2, #Label3 {
    font-size: 15px;
    font-weight: bold;
    color: #333;
}

#TextBox1, #TextBox2 {
    width: 220px;
    padding: 9px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

#Button1 {
    background-color: #176b87;
    color: white;
    border: none;
    padding: 10px 25px;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
}

#Button1:hover {
    background-color: #104d63;
}

#Label4 {
    color: #dc3545;
    font-weight: bold;
}
.login-box {
    width: 350px;
    margin: 70px auto;
    padding: 30px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.login-box h2 {
    color: #173b57;
    font-size: 25px;
}

.login-box h3 {
    color: #176b87;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 20px;
    text-align: left;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

#TextBox1, #TextBox2 {
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

#Label4 {
    color: #dc3545;
}
    </style>
</head>
<body>
     <form id="form1" runat="server">

        <div class="login-box">

            <h2>My E-Commerce Store</h2>
            <h3>Login Page</h3>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server"
                    Text="Username"></asp:Label>

                <asp:TextBox ID="TextBox1" runat="server"
                    placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server"
                    Text="Password"></asp:Label>

                <asp:TextBox ID="TextBox2" runat="server"
                    TextMode="Password"
                    placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button ID="Button1" runat="server"
                    OnClick="Button1_Click"
                    Text="Login" />
            </div>

            <asp:Label ID="Label4" runat="server"></asp:Label>

        </div>

    </form>
</body>
</html>
