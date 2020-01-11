<%-- 
    Document   : choose-type
    Created on : 20-Aug-2018, 06:02:10
    Author     : HP PRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="Assets/fonts/font-awesome/css/font-awesome.css">
    <link href="Assets/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="Assets/css/custom-style.css">
</head>

<body>
    <div class="row">
        
          <div class="col-lg-12 left-col">
      <header>
        <div id="logo">
          
        </div>
      </header>
            <div class="left-col-content">
              <h2>CHOOSE TYPE OF WEBSITE</h2>
              <P>This way we can share some template idea.</P>
              <form action="">
                  <select id="type-of-site">
                  
                  <option id="selected-option" selected>What type of website do you... ?</option>
                  <option>Agency</option>
                  <option>Education</option>
                  <option>E-commerce</option>

                </select>

                <label>(Optional)</label>
                <script>
     
     $(document).ready(function(){
       $("#type-of-site").on("change", function(){
            var option = $(this).val();
            var url = "generator.jsp?type="+option;
            $("#generator-link").attr("href",url);
       });
    });
</script>
                
<a id="generator-link" class="btn btn-lg btn-color-blue btn-height-45px" href="generator.jsp" style="width:90%;">Next<i class="fa fa-arrow-right"></i></a>
              </form>
            </div>
          </div>
<!--
       
          <div class="col-lg-6 right-col">
            <div class="">
              <img src="Assets/images/type-of-website-image.png">
            </div>
       
        </div>
-->
    </div>

    <!-- jQuery -->
    <script src="Assets/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Assets/js/bootstrap.min.js"></script>

</body>

</html>
