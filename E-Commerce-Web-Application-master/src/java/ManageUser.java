import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ManageUser {
    public ManageUser(){}
    public ResultSet returnUserData(String Userid) throws ClassNotFoundException, SQLException
    {
        Connect con = new Connect();
        Statement st = con.getConnected();
        ResultSet rs = st.executeQuery("Select * from allusers where uid ='"+Userid+"'");
        return rs;
    }
    public int addUser(String id, String name, String pass, String email, String phone) throws ClassNotFoundException, SQLException
    {
        Connect con = new Connect();
        Statement st = con.getConnected();
        int val = st.executeUpdate("Insert into allusers (uid,uname,upass,uemail,umobileno) values ('"+id+"','"+name+"','"+pass+"','"+email+"','"+phone+"')");
        return val;
    }
    public int updateUserPassword(String id, String pass) throws ClassNotFoundException, SQLException
    {
        Connect con = new Connect();
        Statement st = con.getConnected();
        int val = st.executeUpdate("Update `allusers` set upass='"+pass+"' where uid = '"+id+"'");
        return val;
    }
}
