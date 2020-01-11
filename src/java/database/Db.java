/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 * Db connection 
 * @author Musa
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db {
    public Connection conn ;
    PreparedStatement pst;
    Statement stmt;
    ResultSet rs;
    
    public Db(String url, String user, String password)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        }catch(SQLException ex){
            Logger lgr = Logger.getLogger(Db.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Connect the HTML page generator database automatically
    public Db()
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/html_page_generator", "root", "");
        }catch(SQLException ex){
            Logger lgr = Logger.getLogger(Db.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //A select query statement is exercuted here
    public ResultSet select(String Query)
    {
        ResultSet rs = null;
        try {
            pst = conn.prepareStatement(Query);
            rs = pst.executeQuery();    
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(Db.class.getName()).log(Level.SEVERE, null, ex);
        } /*finally{
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Db.class.getName()).log(Level.SEVERE, null, ex);
            }
        }*/
        return rs;
    }
    
    public void insert(String Query)
    {
        try {
            
            pst = conn.prepareStatement(Query);
            pst.execute();
            
            //STEP 6: Clean-up environment
            //rs.close();
            pst.close();
           
            
        }catch(SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        }catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        }finally{
            //finally block used to close resources
            try{
                if(pst!=null)
                    pst.close();
      
            }catch(SQLException se2){
            }
        }
    }
    
    public boolean insertWithReturn(String Query)
    {
        try {
            
            pst = conn.prepareStatement(Query);
            boolean p = pst.execute(); 
            
            conn.close();
            return p;
           
        } catch (SQLException ex) {
            Logger.getLogger(Db.class.getName()).log(Level.SEVERE,  ex.getMessage(), ex);
        }
        return false;
    }
    
    public void update(String Query)
    {
        try {
            
            pst = conn.prepareStatement(Query);
            pst.execute();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Db.class.getName()).log(Level.SEVERE,  ex.getMessage(), ex);
        }
    }
    
    public void closeConnection(){
        // nothing we can do
                try{
                    if(conn!=null)
                        conn.close();
                }catch(SQLException se){
                    se.printStackTrace();
                }//end finally try
    }
            
}
/*
class test{
    public static void main(String[] args) {
        
         Db database = new Db();
         //String update = "UPDATE project SET `p_modified`='"+timeStamp+"' WHERE `p_id`= "+2+"";
         for(int i = 8; i<18 ; i++){
         String pquery = "INSERT INTO project (`p_id`, `p_name`, `p_url`, `p_date`, `p_modified`) VALUES ('"+i+"', 'unknown', '', CURRENT_TIMESTAMP, '0000-00-00')";
         
         database.insert(pquery);
         }
         
         // nothing we can do
                try{
                    if(database.conn!=null)
                        database.conn.close();
                }catch(SQLException se){
                    se.printStackTrace();
                }//end finally try
            }//end tr
        
        // boolean result = database.insertWithReturn(pquery);
        // System.out.println(result);
         
   }
}*/