
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                width: 50%;
                height: auto;
                margin: 20px 0 50px 0px;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
                background: #fff;
                color: #222;
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
            table input[type="text"]{
                width: 100%;
                padding: 10px;
                border-radius: 3px;
                border: 1px solid #222;
                outline: none;
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
             select{
                font-size: 15px;
                font-weight: 500;
                letter-spacing: 1px;
                border: none;
                outline: none;
                color: #fff;
                padding: 15px 20px;
                background: #5800FF;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="UserHeaderAdmin.jsp"/>
            <div>
                <form action="AddProduct" method="Post">
                    <center>
                        <h1>ADD PRODUCT DETAILS</h1>
                        <table >
                            <tr>
                                <td><label >Enter Product Name </label></td>
                                <td><input type="text" name="pn"></td>
                            </tr>
                            <tr>
                                <td><label >Enter Product Description </label></td>
                                <td><input type="text" name="pd"></td>
                            </tr>
                            <tr>
                                <td><label >Enter Quantity </label></td>
                                <td><input type="text" name="pq"></td>
                            </tr>
                            <tr>
                                <td><label >Enter Price </label></td>
                                <td><input type="text" name="pp"></td>
                            </tr>
                            <tr>
                                <td><label >Enter Seller Name </label></td>
                                <td><input type="text" name="ps"></td>
                            </tr>
                            <tr>
                                <td><label >Select Category </label></td>
                                <td>
                                    <select name="pc">
                                        <option disabled="" selected="">Select One</option>
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
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="Insert Product">
                                </td>
                            </tr>
                        </table>
                    </center>
                </form>
            </div> 
        </header>
    </body>
</html>

