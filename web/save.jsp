<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : save
    Created on : 22-Aug-2018, 07:35:36
    Author     : MUSA DABRA
--%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="database.Db" %>
<%
     //TAKE REQUEST MADE AJAX
     String message = (String)request.getParameter("message");
     String pName = (String)request.getParameter("pname");
     Integer nextId = (Integer)session.getAttribute("projectId");
     String userId = (String)session.getAttribute("userId");

     
     Db database = new Db();
         boolean idExist = false; 
         
         if( nextId != null ){
            // TO CHECK WEITHER THE PROJECT EXIST OR NOT
            String previousId = "SELECT p_id FROM project WHERE p_id = '"+nextId+"'";
            
            ResultSet result = database.select(previousId);
             
             try {
                 
                 idExist = result.next();
                
             } catch (SQLException ex) {
                ex.getMessage();
             }
        }
        
     if( message != null )
     {    
         if(idExist){
             String timeStamp = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
             //System.out.println(timeStamp);
             String update = "UPDATE project SET `p_modified`='"+timeStamp+"' WHERE `p_id`= "+nextId+"";
             database.update(update);
             out.print("Project Updated");
         
         }else{
            
            String pquery = "INSERT INTO project (`p_id`, `p_name`, `p_url`, `p_date`, `p_modified`) VALUES ('"+nextId+"', 'unknown', '', CURRENT_TIMESTAMP, '0000-00-00')";
            String cquery = "INSERT INTO used_for (`p_id`, `p_ids`) VALUES ('"+nextId+"', '"+message+"')";
            String projectOf = "INSERT INTO project_of (`id`, `p_id`) VALUES ('"+userId+"', '"+nextId+"')";
           database.insert(projectOf);
           database.insert(pquery);
           database.insert(cquery);
            
           
            //CLOSE CONNECTION WHEN DONE WITH IT
            database.closeConnection();
            out.print("Project Saved!");
         }
         
        
     }
%>
