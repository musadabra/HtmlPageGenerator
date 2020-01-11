<%-- 
    Document   : logout
    Created on : 27-Jun-2018, 00:50:53
    Author     : Musa Dabra
--%>
<%
 String user = (String)session.getAttribute("user");
 if((user != null || user != "")){ 
    session.invalidate();
    // New location to be redirected
    String site = new String("login.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);  
 }else{
    session.invalidate();
    // New location to be redirected
    String site = new String("login.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);  
 } 
%>