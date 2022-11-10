
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Insertion {
    public int insertCategory(String Name) throws ClassNotFoundException, SQLException
    {
        Connect con = new Connect();
        Statement st = con.getConnected();
        int bool = st.executeUpdate("Insert into categories (c_name) values ('"+Name+"')");
        return bool;
    }
    
    public int insertProduct(String Name,String de, int q, int p, String ps, int cid) throws ClassNotFoundException, SQLException
    {
        Connect con = new Connect();
        Statement st = con.getConnected();
        int bool = st.executeUpdate("Insert into products(Pname, pDesc, pQty, PPrice, pSeller,cat_id) values ('"+Name+"','"+de+"','"+q+"','"+p+"','"+ps+"','"+cid+"')");
        return bool;
    }
}
