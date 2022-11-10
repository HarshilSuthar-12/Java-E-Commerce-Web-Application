<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Categories</title>
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
                height: auto;
                background: linear-gradient(to top, rgba(0,0,0,0.3), rgba(0,0,0,0.8)), url(bg1.png);
            }
            .catagories th.th1{
                padding: 20px;
                color: #f7b733;    
                font-size: 2rem;
                margin: auto;
            }
            .catagories th.th2{
                margin: 20px 0;
            }
            .catagories th.th2 a{
                padding: 8px 20px;
                background-color: #f7b733;
                color: #fff;
                border-radius: 100px;
            }
            .catagories table .bb{
                border-bottom: none !important;
            }
            table {
                width: 50%;
                height: auto;
                margin: 20px 0 50px 0px;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
                /*box-shadow: 0 0 10px #222;*/
                background: #fff;
                color: #222;
/*                background: rgba( 0, 0, 0, 0.5 );
                box-shadow: 0 8px 32px 0 rgba( 0, 0, 0, 0.37 );
                backdrop-filter: blur( 4px );
                -webkit-backdrop-filter: blur( 4px );
                border-radius: 10px;
                border: 1px solid rgba( 255, 255, 255, 0.1 );*/
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
                display: flex;
                justify-content: space-around;
                align-items: center;
            }
            .heading h2{
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 20px;
                margin: 30px 0 ;
            }
            .heading h2 a{
                color: #fff;
                padding: 10px 20px;
                background: #5800FF;
                border-radius: 5px;

            }

        </style>
    </head>
    <body>
        <header>
            <jsp:include page="UserHeaderAdmin.jsp" />

            <div class="heading selection">
                <h1>CATEGORIES</h1>
                <h2><a a href="addCat.html">Add Category</a></h2>
                <center>
                    <table>
                        <thead>
                        <th>Serial Number</th>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Update Category</th>
                        <th>Remove Category</th>
                        </thead>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project", "root", "");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("Select * from `categories`");
                            int temp;
                            temp = 0;
                            while (rs.next()) {
                                temp++;
                        %>
                        <tr>
                            <td><%= temp%></td>
                            <td><%= rs.getString(1)%></td>
                            <td><%= rs.getString(2)%></td>
                        <form action="edtCategory.jsp" method="Post">
                            <input type="hidden" value="<%= rs.getInt(1)%>" name="cID">
                            <td><input type="submit" value="Edit"></td>
                        </form>
                        <form action="DeleteCategory.jsp" method="Post">
                            <input type="hidden" value="<%= rs.getInt(1)%>" name="cID">
                            <td><input class="dltred" type="submit" value="Delete" name="cID"></td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </center>
            </div>   
            <%--<jsp:include page="UserFooter.jsp" />--%>
        </header>
    </body>
</html>
