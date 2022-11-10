<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Products</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
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
            table {
                width: 80%;
                height: auto;
                margin: 20px 0 50px 0px;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
                background: #fff;
                color: #222;
            }
             table th.th1{
                padding: 20px;
                color: #f7b733;    
                font-size: 2rem;
                margin: auto;
            }
            table th.th2{
                margin: 20px 0;
            }
            table th.th2 a{
                padding: 8px 20px;
                background-color: #f7b733;
                color: #fff;
                border-radius: 100px;
            }
            
            
            table th{
                padding: 15px 0;
                border-bottom: 1px solid #444;
                color: #222;
            }
            table tr td {
                padding: 10px 20px;
                color: #222;
                border-bottom: 1px solid #222;
            }

            table td input[type="submit"]{
                padding: 10px 30px;
                border: none;
                outline: none;
                background: #5800FF;
                border-radius: 10px;
                color: #fff;
                font-weight: 400;
                letter-spacing: 1px;
                transition: 0.3s linear;
                cursor: pointer;
            }
            table td input.dltred{
                background: #E3394B;
            }
             h1{
                width: 100%;
                overflow: hidden;
                font-size: 2rem;
                color: #fff;
                letter-spacing: 3px;
                margin: 10px 0;
                padding: 10px;
                border-radius: 100px;
                border: none;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }
             h2{
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 20px;
                margin: 30px 0 ;
            }
             h2 a{
                color: #fff;
                padding: 10px 20px;
                background: #5800FF;
                border-radius: 5px;

            }

        </style>
    </head>
    <body>
        <header>
            <jsp:include page="UserHeaderAdmin.jsp"/>
            <div>
                <h1>MEN/WOMEN WEARS PRODUCTS</h1>
                <h2><a a href="AddPro.jsp" class="link-light text-decoration-none">Add Product</a></h2>   
                <center>
                    <table>
                        <thead>
                        <th>Serial Number</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Product Seller</th>
                        <th>Update Product</th>
                        <th>Remove Product</th>
                        </thead>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("Select * from `products` where CAT_ID = (select C_ID from categories where C_NAME = 'MEN/WOMEN WEARS')");
                            int temp;
                            temp = 0;
                            while (rs.next()) {
                                temp++;
                        %>
                        <tr class="text-white">
                            <td><%= temp%></td>
                            <td><%= rs.getInt(1)%></td>
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getInt(5)%></td>
                            <td><%= rs.getInt(4)%></td>
                            <td><%= rs.getString(6)%></td>
                        <form action="editProduct.jsp" method="Post">
                            <input type="hidden" value="<%= rs.getInt(1)%>" name="pid">
                            <td><input type="submit" value="Edit"></td>
                        </form>
                        <form action="DeleteProduct.jsp" method="Post">
                            <input type="hidden" value="<%= rs.getInt(1)%>" name="pid">
                            <td><input class="dltred" type="submit" value="Delete" name="pID"></td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </center>
            </div> 
        </header>
    </body>
</html>
