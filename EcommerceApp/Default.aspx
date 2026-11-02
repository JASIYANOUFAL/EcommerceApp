<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommerceApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | My E-Commerce Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .home-content {
            max-width: 1100px;
            margin: 30px auto;
            padding: 20px;
        }

        .hero {
            padding: 55px 40px;
            border-radius: 14px;
            color: white;
            background: linear-gradient(120deg, #173b57, #176b87);
        }

        .hero h2 {
            color: white;
            font-size: 42px;
            margin: 0 0 12px;
        }

        .hero p {
            font-size: 17px;
            line-height: 1.6;
        }

        .hero a {
            display: inline-block;
            margin: 10px 10px 0 0;
            padding: 12px 18px;
            border-radius: 5px;
            color: #173b57;
            background: white;
            font-weight: bold;
            text-decoration: none;
        }

        .section-title {
            margin: 35px 0 18px;
        }

        .product-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .product-card {
            overflow: hidden;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: white;
        }

        .product-card img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        .product-card div {
            padding: 15px;
        }

        .product-card h3 {
            margin-top: 0;
            color: #173b57;
        }

        @media (max-width: 700px) {
            .product-cards {
                grid-template-columns: 1fr;
            }

            .hero {
                padding: 35px 24px;
            }

            .hero h2 {
                font-size: 32px;
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

        <main class="home-content">
            <section class="hero">
                <h2>Welcome to Our E-commerce Store</h2>
                <p>Discover electronics, fashion and everyday essentials—all in one place.</p>
                <a href="Products.aspx">View Products</a>
                <a href="Register.aspx">Create an Account</a>
                <a href="Login.aspx">Login</a>
            </section>

            <h2 class="section-title">Explore Our Store</h2>

            <section class="product-cards">
                <div class="product-card">
                    <img src="Images/laptop.jpg" alt="Laptop" />
                    <div>
                        <h3>Electronics</h3>
                        <p>Explore laptops and electronics for everyday use.</p>
                    </div>
                </div>

                <div class="product-card">
                    <img src="Images/shoes.jpg" alt="Shoes" />
                    <div>
                        <h3>Fashion</h3>
                        <p>Find clothing and footwear to suit your style.</p>
                    </div>
                </div>

                <div class="product-card">
                    <img src="Images/earbuds.jpg" alt="Earbuds" />
                    <div>
                        <h3>Accessories</h3>
                        <p>Browse useful accessories and everyday essentials.</p>
                    </div>
                </div>
            </section>
        </main>

        <footer class="footer">
            <p>&copy; 2026 My E-Commerce Store. All rights reserved.</p>
            <p>
                <a href="Products.aspx">Products</a> |
                <a href="Login.aspx">Login</a> |
                <a href="Register.aspx">Register</a> |
                <a href="Cart.aspx">My Cart</a>
            </p>
        </footer>

    </form>
</body>
</html>
