<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="EcommerceApp.OrderSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Successful</title>
    <link href="Style.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
        .success-box {
            max-width: 600px;
            margin: 80px auto;
            padding: 40px;
            text-align: center;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .success-box h2 {
            color: #198754;
            font-size: 30px;
            margin-bottom: 15px;
        }

        .success-box p {
            color: #555;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="success-box">
            <h2>Order Placed Successfully!</h2>
            <p>Thank you for shopping with us.</p>
        </div>
    </form>
</body>
</html>
