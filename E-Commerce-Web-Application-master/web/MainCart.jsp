<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Home Page</title>
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
                /*background: #111;*/
                /*background-image: url(bg1.png);*/
                background: linear-gradient(to top, rgba(0,0,0,0.3), rgba(0,0,0,0.8)), url(bg1.png);
            }
            center h1{
                color: #fff;
                padding: 10px;
            }
            table{
                width: 90%;
                height: auto;
                margin: 20px 0 50px 0px;
                padding: 30px;
                color:#222;  
                border-radius: 10px;
                border: 1px solid #333;
                /*box-shadow: 0 0 10px #222;*/
                background: #fff;
                /*background-image: linear-gradient(90deg, #020024 0%, #090979 35%, #00d4ff 100%);*/
/*                background: rgba( 0, 0, 0, 0.5 );
                box-shadow: 0 8px 32px 0 rgba( 0, 0, 0, 0.37 );
                backdrop-filter: blur( 4px );
                -webkit-backdrop-filter: blur( 4px );
                border-radius: 10px;
                border: 1px solid rgba( 255, 255, 255, 0.1 );*/

            }
            table th {
                border-bottom: 1px solid #222;
                padding: 0 0 20px 0;
            }
            table td{
                color: #222;
                padding: 10px 5px;
                border-bottom: 1px solid #222;
            }
            table td input.btn1{
                background: #222;
                color:#fff;
                padding: 10px 20px;
                border: none;
                outline: none;
                border-radius: 5px;  
            }
            table td input.btngreen{
                background: #27ABEB;
                color:#fff;
                cursor: pointer;
            }
            table td input.btnred{
                background: #E3394B;
                color:#fff;
                cursor: pointer;
            }
            table td input.btn{
                padding: 10px 25px;
                border: none;
                outline: none;
                background: #f7b733;
                color: #fff;
                border-radius: 5px;
                cursor: pointer;
            }
            center h4{
                color: #fff;
                font-size: 20px;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin: 30px 0 60px 0;
            }
            center a{
                margin: 0 10px;
                padding: 10px 25px;
                text-decoration: none;
                background-color: #222;
                color: #fff;
                font-size: 1rem;
                border-radius: 3px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="UserHeader.jsp" />
        <header>
            <div>
                <center>
                    <h1>MY CART</h1>
                </center>
                <%

                    HttpSession sn = request.getSession(false);
                    String ab = sn.getAttribute("uid").toString();

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("Select * from `cart` where uid = '" + ab + "'");
                    int temp, row_count = 0;
                    temp = 0;
                    while (rs.next()) {
                        temp++;
                    }
                    if (temp < 1) {
                %>
                <center><h4>Item Not is Added In Your Cart</h4><a href="listProduct_User.jsp">Add Items.</a></center>
                    <%
                    } else {
                    %>
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
                        <th>Action</th>
                        </thead>
                        <%
                            int sum = 0;
                            ResultSet rs2 = st.executeQuery("Select * from `cart` where uid = '" + ab + "'");
                            int tempor = 0;
                            while (rs2.next()) {
                                tempor++;
                        %>
                        <form method="Post" action="ManageCart.jsp">
                            <tr>
                                <td><%= tempor%></td>
                                <td>
                                    <input type="hidden" value="<%= rs2.getString(8)%>" name="pname">
                                    <%= rs2.getString(8)%>
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
                                    <input type="text" id="qty" class="btn1 p-1 m-1 w-25" value="<%= rs2.getInt(4)%>" >
                                    <input type="submit" class="btn btn-primary m-1" value="+" name="abc">
                                    <input type="submit" class="btn btn-danger m-1" value="-" name="abc">
                                </td>
                                <td>
                                    <input type="hidden" value="<%= rs2.getString(6)%>" name="pseller">
                                    <input type="hidden" value="<%= rs2.getString(7)%>" name="cat">
                                    <%= rs2.getString(6)%>
                                </td>

                            <input type="hidden" value="<%= rs2.getInt(2)%>" name="pid">
                            <input type="hidden" value="<%= rs2.getInt(1)%>" name="cid">
                            <td>
                                <input class="btn1 btngreen" type="submit" name="abc" value="Book Order Now">
                            </td> 
                            <td>
                                <input class="btn1 btnred" type="submit" name="abc" value="Remove From Cart">
                            </td>
                            </tr>
                            <tr class="text-light   ">
                                <td colspan="6">

                                </td>
                                <td>
                                    Total Amount
                                </td>
                                <%
                                    int amount = rs2.getInt(5) * rs2.getInt(4);
                                %>
                                <td>
                                    <%= amount%>
                                </td>
                            </tr>
                        </form>
                        <%
                                }
                            }
                        %>
                </center>
                </table>
            </div> 
        </header>   
    </body>
</html>