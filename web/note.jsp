<%-- 
    Document   : note
    Created on : 23-Aug-2018, 22:53:25
    Author     : HP PRO
--%>
<%@page import="database.Db"%>
<%
    
     //TAKE REQUEST MADE AJAX
    
     String x = (String)request.getParameter("x");
     String y = (String)request.getParameter("y");
     String note = (String)request.getParameter("message");
    
     Integer projId = (Integer)session.getAttribute("projectId");
     //CHECK IF THE REQUEST VALUE IS TEXT/IMAGE OR DIV
    
     //out.print(projId+" :"+x+" :"+y);
     if( note != null && projId != null )
     {   
        Db database = new Db();
        //INSERT INTO note (`p_id`, `note`, `x_pos`, `y_pos`, `note_id`) VALUES ('1', ' 2 note here', '55', '44', NULL);
        String notequery = "INSERT INTO note (`p_id`, `note`, `x_pos`, `y_pos`, `note_id`) VALUES ('"+projId+"', '"+note+"', '"+x+"', '"+y+"', NULL)";
       
        database.insert(notequery);
        database.closeConnection();
          out.print("Note Saved!"); 
     }

   
%>