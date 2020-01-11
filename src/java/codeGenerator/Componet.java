package codeGenerator;

/**
 *
 * @author MUSA DABRA
 */
import Cosc301.*;
import database.Db;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
        
public class Componet {
    protected Db db;
    
    public Componet()
    {
        db = new Db();
    }
    
    public String getComponet(String componentName, String id)
    { 
        try {
            String components = "";
            String query = "select pc_code from page_compoment where pc_id = "+id+" and pc_name='"+componentName+"'";
            ResultSet result = db.select(query);
            while(result.next())
                components += result.getString("pc_code");
            return components;
        } catch (SQLException ex) {
            Logger.getLogger(Componet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
     public String getComponet(String componentName)
    {
        try {
            String components = "";
            String query = "select pc_code from page_compoment where pc_name='"+componentName+"'";
            ResultSet result = db.select(query);
            while(result.next())
                components += result.getString("pc_code");
            return components;
        } catch (SQLException ex) {
            Logger.getLogger(Componet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }   
     
     public String getComponetsUrls(String componentUrl)
    {
        try {
            String components = "";
            String query = "select * from page_compoment where pc_name='"+componentUrl+"'";
            ResultSet result = db.select(query);
            while(result.next()){
                components += "<li>\n" +
"		          				<div class=\"col-lg-12\">\n" +
"		          				   <div class=\"col-lg-10\">\n" +
"		          				   	 <p class=\"component-discription\">"+result.getString("description")+"</p>\n" +
"		          				   </div>\n" +
"					          		\n" +
"					           	   <div class=\"component-image\">  \n" +
"					           		<img src=\""+result.getString("pc_image_url")+"\">\n" +
"					           		<input class=\"choisebutton\" type=\"radio\" value=\""+result.getInt("pc_id")+"\" name=\""+result.getString("pc_name")+"\" value=\"\">\n" +
"					           </div>\n" +
"				          	</div>\n" +
"				          	</li>";
            
            }
            return components;
        } catch (SQLException ex) {
            Logger.getLogger(Componet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    } 
     
    public String getComponetsUrl(String id)
    {
        try {
            String components = "";
            String query = "select pc_image_url from page_compoment where pc_id='"+id+"'";
            ResultSet result = db.select(query);
            while(result.next()){
                components += "<img src=\""+result.getString("pc_image_url")+"\">";    
            }
            return components;
        } catch (SQLException ex) {
            Logger.getLogger(Componet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }   
}
