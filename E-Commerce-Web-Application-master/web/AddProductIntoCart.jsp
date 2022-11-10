
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
                HttpSession sn = request.getSession(false);
                String ab = sn.getAttribute("uid").toString();
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                Statement st = con.createStatement();
                
                String id = request.getParameter("pid");
                String name = request.getParameter("pname");
                String dsc = request.getParameter("pdesc");
                String price = request.getParameter("pprice");
                String cat = request.getParameter("cat");
                String Seller = request.getParameter("pseller");
                int temp = 1;
                int a = st.executeUpdate("Insert Into Cart (C_PID, C_PDesc, C_PQty, C_pPrice, C_Pseller, CAT_ID, C_PName, uid) Values ('"+id+"','"+dsc+"','"+temp+"','"+price+"','"+Seller+"','"+cat+"','"+name+"','"+ab+"')");
                if(a<0)
                {
                    response.sendRedirect("listProduct_User.jsp");
                }
                else{
                    response.sendRedirect("MainCart.jsp");
                }
        %>
    </body>
</html>
