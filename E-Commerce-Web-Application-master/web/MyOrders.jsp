<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Orders</title>
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
                height: 100vh;
                background: linear-gradient(to top, rgba(0,0,0,0.3), rgba(0,0,0,0.8)), url(bg1.png);
            }
            center h1{
                color: #fff;
                padding: 10px;
            }
            table{
                width: 80%;
                height: auto;
                margin: 20px 0 50px 0px;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
                box-shadow: 0 0 10px #222;
                background: #fff;
                color: #222;  
/*                background: rgba( 0, 0, 0, 0.5 );
                box-shadow: 0 8px 32px 0 rgba( 0, 0, 0, 0.37 );
                backdrop-filter: blur( 4px );
                -webkit-backdrop-filter: blur( 4px );
                border-radius: 10px;
                border: 1px solid rgba( 255, 255, 255, 0.1 );*/
            }
            table th {
                border-bottom: 1px solid #333;
                padding: 0 0 20px 0;
            }
            table td{
                color: #222;
                padding: 10px 20px;
                border-bottom: 1px solid #222;
            }
        </style>
    </head>
    <body>
        <div>
            <header>

                <jsp:include page="UserHeader.jsp"/>

                <div>
                    <center>
                        <h1>MY ORDERS</h1>
                        <table>
                            <thead>
                            <th>Serial Number</th>
                            <th>Order ID</th>
                            <th>Product Name</th>
                            <th>Product Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th>Product Seller</th>
                            <th>Order Date-Time</th>
                            </thead>
                            <%
                                HttpSession sn = request.getSession(false);
                                String ab = sn.getAttribute("uid").toString();

                                String s = "OxAaMca24";
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("Select * from `orders` where user_id = '" + ab + "'");
                                int temp;
                                temp = 0;
                                while (rs.next()) {
                                    temp++;
                            %>
                            <form>
                                <tr>
                                    <td><%= temp%></td>
                                    <td>
                                        <%= s + temp + rs.getString(1)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(3)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(4)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(5)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(6)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(7)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(8)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(9)%>
                                    </td>
                                </tr>
                            </form>
                            <%
                                }
                            %>
                        </table>
                    </center>
                </div>        


        </div>
        <%--<jsp:include page="UserFooter.jsp" />--%>
    </header>
</body>
</html>