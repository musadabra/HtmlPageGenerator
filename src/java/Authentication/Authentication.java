package Authentication;

/**
 *
 * @author MUSA DABRA
 */
import database.Db;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Authentication {
    public String username;
    public String password;
    public String userId;
   
    protected Db database;
    
    
    public Authentication()
    {
        database = new Db();
    }
    
    public boolean isValidUser(String username, String password)
    {
        try {
            String sql = "SELECT * FROM user WHERE username = '"+username+"' AND password = '"+password+"'";
            ResultSet result = database.select(sql);
            while(result.next())
            {
                this.username = result.getString("username");
                this.password = result.getString("password");
                userId = result.getString("id");
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public boolean isValidEmail(String email)
    {
        try {
            String sql = "SELECT * FROM user WHERE email = '"+email;
            ResultSet result = database.select(sql);
            while(result.next())
                return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
}