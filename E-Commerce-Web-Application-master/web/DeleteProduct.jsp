
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
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
        <%
            int id = Integer.parseInt(request.getParameter("pid"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
            Statement st = con.createStatement();
            ResultSet rs2 = st.executeQuery("Select * From `products` where ProductId = '" + id + "'");
            int Quant = 0, Price = 0, Cat = 0;
            String Name = "", Desc = "", SellerName = "";
            while (rs2.next()) {
                Name = rs2.getString(2);
                Desc = rs2.getString(3);
                Quant = rs2.getInt(4);
                Price = rs2.getInt(5);
                SellerName = rs2.getString(6);
                Cat = rs2.getInt(7);
            }
        %>
        <header>
            <jsp:include page="UserHeaderAdmin.jsp"/>
            <div>
                <form action="deleteProductFinally.jsp" method="post">
                    <center>

                        <h1>Delete PRODUCT DETAILS</h1>
                        <input type="hidden" name="pid" value="<%= id%>">
                        <table>
                            <tr>
                                <td><label>Enter Product Name </label></td>
                                <td><input type="text" name="pn" value="<%= Name%>"></td>
                            </tr>
                            <tr>
                                <td><label>Enter Product Description </label></td>
                                <td><input type="text" name="pd" value="<%= Desc%>"></td>
                            </tr>
                            <tr>
                                <td><label>Enter Quantity </label></td>
                                <td><input type="text" name="pq" value="<%= Quant%>"></td>
                            </tr>
                            <tr>
                                <td><label>Enter Price </label></td>
                                <td><input type="text" name="pp" value="<%= Price%>"></td>
                            </tr>
                            <tr>
                                <td><label>Enter Seller Name </label></td>
                                <td><input type="text" name="ps" value="<%= SellerName%>"></td>
                            </tr>
                            <tr>
                                <td><label>Select Category </label></td>
                                <td>
                                    <select name="pc">
                                        <option disabled="">Select One</option>
                                        <%
                                            ResultSet rs = st.executeQuery("Select * from `categories`");
                                            while (rs.next()) {
                                                if (rs.getInt(1) == Cat) {
                                        %>
                                        <option selected="" value="<%= rs.getInt(1)%>"><%= rs.getString(2)%></option>
                                        <%
                                                        } else {%>
                                        <option value="<%= rs.getInt(1)%>"><%= rs.getString(2)%></option>
                                        <%}
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="Delete Product">
                                </td>
                            </tr>
                        </table>
                    </center>
                </form>
            </div>
        </header>                        
    </body>
</html>
