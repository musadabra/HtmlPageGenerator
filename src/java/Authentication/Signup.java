/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Authentication;

/**
 *
 * @author MUSA DABRA
 */
import database.Db;
import java.sql.ResultSet;
public class Signup {
    Db database;
    
    public Signup(){
        database = new Db();
    }
    
    public boolean userExist(String username){
        String query =  "SELECT * FROM user WHERE username = '"+username+"";
        try {
            ResultSet result = database.select(query);
            
            while(result.next())
            {
                String user = result.getString("username");
                return true;
            }
            
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }
    
    public boolean addUser(String username, String password, String name, String email){
        String query =  "INSERT INTO `user`(`id`, `username`, `password`, `name`, `email`, `temp_password`) VALUES (NULL,'"+username+"','"+password+"','"+name+"','"+email+"','')";
        try {  
            database.insert(query);    
        } catch (Exception e) {
            e.getMessage();return false;
        }
        return true;
    }
    
    
            
}
/*
class test{
    public static void main(String[] args) {
        System.out.println(new Signup().userExist("adams"));
    }
}*/