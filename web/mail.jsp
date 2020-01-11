<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Db"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    
   String to = (String)request.getParameter("message");
   
   //SELECT TO CHECK IF THE USER EXIST
   //IF SO TAKE THE 
   String emailquery = "select * from user where email='"+to+"'";
   Db database = new Db();
        // boolean idExist = false; 
        
         String inviteeId =null;
         boolean idExist = false;
            ResultSet result = database.select(emailquery);
             
            try {
                 while(result.next()){
                    idExist = true;
                    inviteeId = result.getString("id");
                 } 
                
             } catch (SQLException ex) {
                ex.getMessage();
             }
            //out.println(inviteeId);
           // if(idExist){
                String addInvitation = "INSERT INTO invited_by (`inviter_id`, `invitee_id`) VALUES ('2', '9')";
                database.insert(addInvitation);
            //}
    
   /*
  // String result;
   //String to = "musadabra@gmail.com";
   String from = "musadabra@gmail.com";
   String host = "localhost";
   Properties properties = System.getProperties();
   properties.setProperty("mail.smtp.host", host);
   Session mailSession = Session.getDefaultInstance(properties);
   try{
      MimeMessage message = new MimeMessage(mailSession);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
      message.setSubject("This is the Subject Line!");
      message.setText("This is actual message");
      Transport.send(message);
      result = "Sent message successfully....";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
*/
%>