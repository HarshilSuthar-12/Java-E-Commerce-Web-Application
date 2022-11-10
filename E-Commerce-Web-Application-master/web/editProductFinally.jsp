<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                Statement st = con.createStatement();
                String id = request.getParameter("pid");
                String pnm = request.getParameter("pn");
                String pdsc = request.getParameter("pd");
                int pqty = Integer.parseInt(request.getParameter("pq"));
                int pprice = Integer.parseInt(request.getParameter("pp"));
                String ps = request.getParameter("ps");
                int pc = Integer.parseInt(request.getParameter("pc"));
                
                out.print(pnm+' '+ pdsc + ' '+ pqty + ' ' + pprice +' '+ ps + + pc);
                
                int res = st.executeUpdate("UPDATE `Products` set Pname = '"+pnm+"', PDesc = '"+pdsc+"', PQty = '"+pqty+"', PPrice='"+pprice+"', Pseller='"+ps+"', CAT_ID='"+pc+"' where ProductId = '"+id+"'");
                if(res>0)
                {
                    response.sendRedirect("listProducts.jsp");
                }
                else{
                    response.sendRedirect("editProduct.jsp");
                }
        %>
    </body>
</html>
