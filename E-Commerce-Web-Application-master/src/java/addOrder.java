/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                
                HttpSession sn = request.getSession(false);
                String a = sn.getAttribute("uid").toString();
            
                String id = request.getParameter("cid");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                Statement st = con.createStatement();
                
                ResultSet rs = st.executeQuery("Select * From `cart` where C_ID = '"+id+"'");
                
                String pid="",pname="",pdesc="",seller="",price="",qunt="",catid="";
                while(rs.next())
                {
                    pid = rs.getString(2);
                    pname = rs.getString(8);
                    pdesc = rs.getString(3);
                    qunt = rs.getString(4);
                    price = rs.getString(5);
                    seller = rs.getString(6);
                    catid = rs.getString(7);
                }
                
                String catName = "";
                ResultSet rs2 = st.executeQuery("Select * From `categories` where C_ID = '"+catid+"'");
                
                while(rs2.next())
                {
                    catName = rs2.getString(2);
                }
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();  
                
                int op = st.executeUpdate("Insert into `orders` (p_id, op_name, op_desc, op_price, op_qty, oc_name, op_seller, o_time, user_id) values ('"+pid+"','"+pname+"','"+pdesc+"','"+price+"','"+qunt+"','"+catName+"','"+seller+"','"+dtf.format(now)+"','"+a+"')");
                if(op>0)
                {
                    int opt = st.executeUpdate("Delete From Cart Where C_ID = '"+id+"'");
                    if(opt>0)
                        response.sendRedirect("MyOrders.jsp");
                    else
                        response.sendRedirect("MainCart.jsp");
                }
                else{
                    response.sendRedirect("MainCart.jsp");
                }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
