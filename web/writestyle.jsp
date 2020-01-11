<%-- 
    Document   : writestyle
    Created on : 01-Aug-2018, 11:30:23
    Author     : MUSA DABRA
--%>
<%
//TAKE REQUEST MADE AJAX
     String element = (String)request.getParameter("element");
     
     //CHECK IF THE REQUEST VALUE IS TEXT/IMAGE OR DIV
     if( element.equalsIgnoreCase("text/image") )
     {
        
     }else if( element.equalsIgnoreCase("div") )
     {
         
     }
    
%>