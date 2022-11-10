
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
            Statement st = con.createStatement();
            String btn = request.getParameter("abc");

            if (btn.equals("Remove From Cart")) {
                String cid = request.getParameter("cid");
                int a = st.executeUpdate("Delete From `cart` where C_ID = '" + cid + "'");
                if (a < 0) {
                    response.sendRedirect("listProduct_User.jsp");
                } else {
                    response.sendRedirect("MainCart.jsp");
                }
            } else if (btn.equals("+")) {
                String cid = request.getParameter("cid");
                int qty = Integer.parseInt(request.getParameter("pqty"));
                qty = qty + 1;
                int a = st.executeUpdate("Update `cart` set C_PQTY = '" + qty + "' where C_ID = '" + cid + "'");
                if (a < 0) {
                    response.sendRedirect("MainCart.jsp");
                } else {
                    response.sendRedirect("MainCart.jsp");
                }
            } else if (btn.equals("-")) {
                String cid = request.getParameter("cid");
                int qty = Integer.parseInt(request.getParameter("pqty"));
                qty = qty - 1;
                int a = st.executeUpdate("Update `cart` set C_PQTY = '" + qty + "' where C_ID = '" + cid + "'");
                if (a < 0) {
                    response.sendRedirect("MainCart.jsp");
                } else {
                    response.sendRedirect("MainCart.jsp");
                }
            } else if (btn.equals("Book Order Now")) {
        %>
        <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Place Your Order</title>
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
                table{
                    width: 50%;
                    height: auto;
                    margin: 20px 0 50px 0px;
                    padding: 30px;
                    border-radius: 10px;
                    border: 1px solid #333;
                    box-shadow: 0 0 10px #222;
                    background: #fff;
                    color: #222;  
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
                table input[type="submit"]{
                    width: 50%;
                    padding: 10px 20px;
                    margin: 10px;
                    background: #5800FF;
                    border: none;
                    outline: none;
                    color: #fff;
                    font-size: 15px;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                    border-radius: 5px;
                }
            </style>
        </head>
        <body>
            <div>
                <header>
                    <jsp:include page="UserHeader.jsp"/>
                    <div>
                        <p>Order Details</p>
                        <form method="Post" action="addOrder" autocomplete="off">
                            <%
                                String cid = request.getParameter("cid");
                                int qty = Integer.parseInt(request.getParameter("pqty"));
                                ResultSet rs = st.executeQuery("Select * From `cart` where C_ID = '" + cid + "'");
                                while (rs.next()) {
                            %>
                            <center>
                                <table>
                                    <tr>
                                        <td>
                                            <input type="hidden" value="<%= rs.getInt(1)%>"  name='cid'>
                                            <b><u>Product Name</u></b>&nbsp;
                                        </td>
                                        <td>
                                            <%= rs.getString(8)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b><u>Product Description</u></b>&nbsp;
                                        </td>
                                        <td>
                                            <%= rs.getString(3)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b><u>Product Seller</u></b>&nbsp;
                                        </td>
                                        <td>
                                            <%= rs.getString(6)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b><u>Product Quantity</u></b>&nbsp;
                                        </td>
                                        <td>
                                            <%= rs.getInt(4)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b><u>Product Price</u></b>&nbsp;
                                        </td>
                                        <td>
                                            <%= rs.getInt(5)%>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td>
                                            <b>Total Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                        </td>
                                        <td>
                                            <b><%= rs.getInt(4) * rs.getInt(5)%></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" value="Place Order">
                                        </td>
                                    </tr>
                                </table>
                            </center>                            
                            <%
                                }
                            %>
                        </form>
                    </div>
                </header>
            </div> 
            <%
                }
            %>
        </body>
    </html>
