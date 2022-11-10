<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'poppins';
                text-decoration: none;
                user-select: none;
            }
            nav{
                width: 100%;
                height: 10vh;
                display: flex;
                justify-content: space-around;
                align-items: center;
                border: 10px;
                background: #fff;
            }
            .Uprofile a{
                margin: 0 10px;
                padding: 10px 25px;
                text-decoration: none;
                background-color: #222;
                color: #fff;
                font-size: 1rem;
                border-radius: 3px;
                transition: all 0.3s linear;
            }
            .Uprofile a.logout{
                background-color: #5800FF;
            }
            nav h1 a{
                text-decoration: none;
                color: #222;
                font-size: 2rem;
                text-transform: uppercase;
            }
            nav ul li {
                display: inline-block;
            }
            nav ul li a{
                margin: 0 5px;
                padding: 10px 25px;
                text-decoration: none;
                color: #222;
                font-size: 1rem;
                border-radius: 3px;
                transition: all 0.3s linear;
            }
            nav ul li a.active{
                background-color: #111;
                color: #fff;
            }
            nav ul li a:hover{
                background-color: #111;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <nav>
            <div class="nav">
                <h1><a href="#">Java E-Commerce</a></h1>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="HomePage.html" class="active">Home</a></li>
                    <li><a href="listProduct_User.jsp">Products</a></li>
                    <li><a href="MyOrders.jsp">My Orders</a></li>
                    <li><a href="MainCart.jsp">My Cart</a></li>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Contat Us</a></li>
                </ul>
            </div>
            <div class="Uprofile">
                <a href="ProfilePage.jsp">My Profile</a>
                <a href="index.html" class="logout">Logout</a>
            </div>
        </nav>
    </body>
</html>
