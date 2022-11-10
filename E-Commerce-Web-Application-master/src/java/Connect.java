
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletContext;

public class Connect {
    public Connect(){}
    public Statement getConnected() throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
        Statement st = con.createStatement();
        return st;
//        ServletContext sc = request.getServletContext();
//        String conn = (String) sc.getInitParameter("Connection");
//        String driver = (String) sc.getInitParameter("Driver");
//        String uname = (String) sc.getInitParameter("uname");
//        String pass = (String) sc.getInitParameter("pass");
//        Class.forName(driver);
//        com.mysql.jdbc.Connection con = (com.mysql.jdbc.Connection) DriverManager.getConnection(conn , uname, pass);
    }
}
