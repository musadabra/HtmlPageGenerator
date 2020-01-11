<%-- 
    Document   : signup
    Created on : 29-Aug-2018, 17:23:48
    Author     : HP PRO
--%>
<%@page import="Authentication.Signup"%>
<%@page import="database.Db"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%
    //TAKE REQUEST MADE AJAX
    String username = (String)request.getParameter("username");
    String password1 = (String)request.getParameter("pass1");
    String password2 = (String)request.getParameter("pass2");
    String email = (String)request.getParameter("email");
    String name = (String)request.getParameter("name");
     
    if( username != "" && password1 != "" && password2 != "" && email != "" && name != ""){
        // EMAIL VALIDATION
        String regex = "^(.+)@(.+)$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        //CHECK IF PASSWORD IS THESAME VALUE
        if(!password1.equalsIgnoreCase(password2)){
            
            out.print("<script> alert('Password Not Thesame'); </script>");
            out.print("<script> location.href=\"login.jsp\" </script>");
            
        }else if(!matcher.matches()){
            
         out.print("<script> alert('Invalid Email Address'); </script>");
         out.print("<script> location.href=\"login.jsp\" </script>");
            
        }else{
            
           Signup signup = new Signup();
           if(signup.userExist(username)){
               out.print("<script> alert('Username Already Exist'); </script>");
               out.print("<script> location.href=\"login.jsp\" </script>");
           }else{
               if(signup.addUser(username, password1, name, email)){
                   out.print(username+" is Registered <a href='login.jsp'>Back to login page</a>");
               }
           }
           
            
        }
       
    }else{
        out.print("<script> alert('Please fill out all input fields'); </script>");
        out.print("<script> location.href=\"login.jsp\" </script>");
    }
   // out.print("<script> alert('submited'); </script>");
%>