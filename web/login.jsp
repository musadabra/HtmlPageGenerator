<%-- 
    Document   : Login
    Created on : 25-Jun-2018, 17:50:41
    Author     : Musa Dabra
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Authentication.Authentication" %>
<%  
   
    String name = (String)request.getParameter("username");
    String pass = (String)request.getParameter("password");
    //String[] error = new String[2];
    String usernameError = "";
    String passwordError = "";
    
    if(name != null || pass != null )
    { 
       // error = new String[2];
        if(name == "")
            usernameError = "Username";
        
        if(pass == "")
           passwordError = "Password";
       
        if(name != "" && pass != "")
        {
            // BY INITIALISING AN OBJECT USING IT, IS DIFFERENT FROM INITIALIZING AND STORING THE DATA IN A VARIABLE
            // BECAUSE THE VALUES INITAILIZED WITH IS DIFFERENT
            Authentication auth = new Authentication();
            if(auth.isValidUser(name, pass))
            {               
                session.setAttribute("username", auth.username);
                session.setAttribute("password", auth.password);
                session.setAttribute("userId", auth.userId);
                
               
                //REDIRRECT TO PAGE
                String site = new String("work-as.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
            }else{
                 out.print("<Script> alert('Wrong Username Or Password'); </script>");
            }
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login | HTML Page Builder.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
      <!--===============================================================================================-->  
        <link rel="icon" type="image/png" href="Assets/images/icons/favicon.ico"/>
      <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="Assets/css/main.css">
      <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Assets/css/custom-style.css">
         <script src="Assets/js/jquery.js"></script>
    </head>

  <body>
        
  <div class="limiter">
    <div class="container-login100">
      <div class="wrap-login100"><!-- login100-form validate-form -->
        <form class="" action="login.jsp" method="post">
          <span class="login100-form-title login-form-logo p-b-48">
            <img src="Assets/images/logo.png">
          </span>
          <span class="login100-form-title p-b-48">
            <%
             if(usernameError != "" || passwordError != ""){
                out.print("Please provide: ");

                for(int i=0 ; i < 2 ; i++){                   
                    if(i == 0){
                        out.print(usernameError+" ");
                    }else{
                        out.print(passwordError);
                    }
                }
             }else{
                 out.print("Please provide correct username & password");
             }
            %>
          </span>  
          <div class="wrap-input100 validate-input" data-validate = "Valid Username plz">
            <input class="input100" type="text" name="username">
            <span class="focus-input100" data-placeholder="username"></span>
          </div>

          <div class="wrap-input100 validate-input" data-validate="Enter password">
            <span class="btn-show-pass">
              <i class="zmdi zmdi-eye"></i>
            </span>
            <input class="input100" type="password" name="password">
            <span class="focus-input100" data-placeholder="password"></span>
          </div>
            
          <div class="container-login100-form-btn">
            <div class="wrap-login100-form-btn">
              <div class="login100-form-bgbtn"></div>
              <input type="submit" class="login100-form-btn btn-color-blue"  value="Login">
            </div>
          </div>      
            <div class="text-center p-t-115 login-buttom-title">
            <span class="txt1">
              Don’t have an account?
            </span>

                <a style="color: #00a1e6 !important;" class="txt2" href="" data-toggle="modal" data-target="#signup">
              Sign Up
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
  
   <!--===============================================================================================-->
  
 <div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                             <span class="login100-form-title p-b-48">
                              <img src="Assets/images/logo.png">
                            </span>
                           
                        </div>
                        <div class="modal-body">
                            
                            <form id="regform" class="pb-modalreglog-form-reg" action="signup.jsp">
                                
                                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                                  <input class="input100" type="text" name="email">
                                  <span class="focus-input100" data-placeholder="Email"></span>
                                </div>
                                
                                <div class="wrap-input100 validate-input" data-validate = "Valid username">
                                  <input class="input100" type="username" name="name">
                                  <span class="focus-input100" data-placeholder="Name"></span>
                                </div>

                                <div class="wrap-input100 validate-input" data-validate="Enter username">
                                
                                  <input class="input100" type="username" name="username">
                                  <span class="focus-input100" data-placeholder="Username"></span>
                                </div>

                                <div class="wrap-input100 validate-input" data-validate="Enter password">
                                  <span class="btn-show-pass">
                                    <i class="fa fa-eye"></i>
                                  </span>
                                  <input class="input100" type="password" name="pass1">
                                  <span class="focus-input100" data-placeholder="Password"></span>
                                </div>
                                
                                <div class="wrap-input100 validate-input" data-validate="Enter password">
                                  <span class="btn-show-pass">
                                    <i class="fa fa-eye"></i>
                                  </span>
                                  <input class="input100" type="password" name="pass2">
                                  <span class="focus-input100" data-placeholder="Comfirm Password"></span>
                                </div>
                          
                            <div class="modal-footer">
                           <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                              <div class="login100-form-bgbtn"></div>
                              <input id="submitreg" type="submit" class="login100-form-btn btn-color-blue" value="Sign Up">
                            </div>
                          </div>
                        </div>
                            </form>
                        </div>
                        <script>/*
                            $(document).ready(function(){
                                 // Variable to store your files
                                        var files;

                                        // Add events
                                        $('#submitreg').on('click', prepareUpload);

                                        // Grab the files and set them to our variable
                                        function prepareUpload(event)
                                        {
                                          files = event.target.files;
                                          $('#regform').submit();
                                        }
                                        
                                       $('#regform').on('submit', uploadFiles);

                                        // Catch the form submit and upload the files
                                        function uploadFiles(event)
                                        {
                                            alert("hey");
                                            event.stopPropagation(); // Stop stuff happening
                                            event.preventDefault(); // Totally stop stuff happening
                                            
                                            // START A LOADING SPINNER HERE

                                            // Create a formdata object and add the files
                                            var data = new FormData();
                                            $.each(files, function(key, value)
                                            {
                                                data.append(key, value);
                                            });

                                            $.ajax({
                                                url: '/HTMLPageGenerator/upload-media-library.jsp',
                                                type: 'POST',
                                                data: data,
                                                cache: false,
                                                processData: false, // Don't process the files
                                                contentType: false, // Set content type to false as jQuery will tell the server its a query string request
                                                success: function(data, textStatus, jqXHR)
                                                {alert(data);
                                                    if(typeof data.error === 'undefined')
                                                    {
                                                        // Success so call function to process the form
                                                        submitForm(event, data);
                                                    }
                                                    else
                                                    {
                                                        // Handle errors here
                                                        console.log('ERRORS: ' + data.error);
                                                    }
                                                },
                                                error: function(jqXHR, textStatus, errorThrown)
                                                {alert(textStatus);
                                                    // Handle errors here
                                                    console.log('ERRORS: ' + textStatus);
                                                    // STOP LOADING SPINNER
                                                }
                                            });
                                        }
                            }); */
                        </script>
                    </div>
                </div>
            </div>

         
       
</body>
    
<!--===============================================================================================-->
 
  <script src="Assets/js/bootstrap.min.js"></script>
  <script src="Assets/js/jquery.js"></script>

<!--===============================================================================================-->
  <script src="Assets/js/main.js"></script>
 
</html>
