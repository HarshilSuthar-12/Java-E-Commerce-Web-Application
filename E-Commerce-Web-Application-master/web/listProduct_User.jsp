<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Enter description one.">
        <meta name="description" content="Enter description two.">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'poppins';
                text-decoration: none;
                user-select: none;
            }
            header{
                width: 100%;
                height: inherit;
                background: linear-gradient(to top, rgba(0,0,0,0.3), rgba(0,0,0,0.8)), url(bg1.png);
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
            .heading h1{
                width: 100%;
                overflow: hidden;
                font-size: 2rem;
                color: #fff;
                letter-spacing: 3px;
                margin: 10px 0;
                padding: 10px;
                border-radius: 100px;
                border: none;
            }
            .selection select{
                font-size: 15px;
                font-weight: 500;
                letter-spacing: 1px;
                margin: 30px 0;
                border: none;
                outline: none;
                color: #fff;
                padding: 15px 20px;
                background: #5800FF;
                border-radius: 5px;
            }
            table{
                width: 60%;
                height: 100%;
                margin: 20px 0 50px 0px;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
                /*box-shadow: 0 0 10px #222;*/
                background: #fff;
                color:#222;  

                /*                background: rgba( 0, 0, 0, 0.5 );
                                box-shadow: 0 8px 32px 0 rgba( 0, 0, 0, 0.37 );
                                backdrop-filter: blur( 4px );
                                -webkit-backdrop-filter: blur( 4px );
                                border-radius: 10px;
                                border: 1px solid rgba( 255, 255, 255, 0.1 );*/
            }
            table td{
                padding: 10px 20px;
                border-bottom: 1px solid #333;

            }
            table td input[type="submit"]{
                padding: 10px 20px;
                border: none;
                outline: none;
                background: #5800FF;
                border-radius: 100px;
                color: #fff;
                font-weight: 400;
                letter-spacing: 1px;
                transition: 0.3s linear;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <header>
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




            <center>
                <div class="heading selection">
                    <h1>PRODUCTS</h1>

                    <h2>
                        <select>
                            <option disabled="" selected="">Select Category</option>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("Select * from `categories`");
                                while (rs.next()) {
                            %>
                            <option value="<%= rs.getInt(1)%>"><%= rs.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                    </h2>
                </div>
            </center>
            <center>
                <table>
                    <thead>
                    <th>Serial Number</th>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Product Seller</th>
                    <th>Action</th>
                    </thead>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
                        st = con.createStatement();
                        ResultSet rs2 = st.executeQuery("Select * from `products`");
                        int temp;
                        temp = 0;
                        while (rs2.next()) {
                            temp++;
                    %>
                    <form method="Post" action="AddProductIntoCart.jsp">
                        <tr>
                            <td><%= temp%></td>
                            <td>
                                <input type="hidden" value="<%= rs2.getString(2)%>" name="pname">
                                <%= rs2.getString(2)%>
                            </td>
                            <td>
                                <input type="hidden" value="<%= rs2.getString(3)%>" name="pdesc">
                                <%= rs2.getString(3)%>
                            </td>
                            <td>
                                <input type="hidden" value="<%= rs2.getInt(5)%>" name="pprice">
                                <%= rs2.getInt(5)%>
                            </td>
                            <td>
                                <input type="hidden" value="<%= rs2.getInt(4)%>" name="pqty">
                                <%= rs2.getInt(4)%>
                            </td>
                            <td>
                                <input type="hidden" value="<%= rs2.getString(6)%>" name="pseller">
                                <input type="hidden" value="<%= rs2.getString(7)%>" name="cat">
                                <%= rs2.getString(6)%>
                            </td>

                        <input type="hidden" value="<%= rs2.getInt(1)%>" name="pid">
                        <td><input type="submit" value="Add To Cart"></td>
                    </form>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </center>    
            <%--<jsp:include page="UserFooter.jsp" />--%>
        </header>
    </body>
</html>
