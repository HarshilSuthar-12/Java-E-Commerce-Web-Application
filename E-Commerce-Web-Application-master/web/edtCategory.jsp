
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
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
        </style>
    </head>
    <body >
        <%
            int id = Integer.parseInt(request.getParameter("cID"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * From `categories` where c_id = '" + id + "'");
            String Name = "";
            while (rs.next()) {
                Name = rs.getString(2);
            }
        %>
        <header>
                <jsp:include page="UserHeaderAdmin.jsp" />
                <div >
                    <form action="edtCategoryFinally.jsp" method="Post">
                        <center>
                            <h1>EDIT CATEGORY DETAILS</h1>
                            <table>
                                <input type="hidden" name="cid" value="<%= id%>">
                                <tr>
                                    <td><label >Enter Category Name </label></td>
                                    <td><input type="text" name="cname" value="<%= Name%>"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input class="form-control" type="submit" value="Update Category">
                                    </td>
                                </tr>
                            </table>

                        </center>
                    </form>
                </div>
        </header>
    </body>
</html>
