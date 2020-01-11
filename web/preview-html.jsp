<%-- 
    Document   : preview
    Created on : 21-Aug-2018, 08:07:11
    Author     : MUSA DABRA 
--%>
<%@page import="Cosc301.Iterator"%>
<%@page import="download.FileCopying"%>
<%@page import="Cosc301.MyLinkedList"%>
<%@page import="java.util.logging.*"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="header.jsp" %>
<%@ page import="codeGenerator.*" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="database.Db" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String headerResult = (String)request.getParameter("header");
    String bannerResult = (String)request.getParameter("banner");
    String mainResult = (String)request.getParameter("main");
    String footerResult = (String)request.getParameter("footer");
    
    String[] components = null;
    boolean invitee = false;
    
    int nextId = 0;
    
    String pId = (String)request.getParameter("projectId");
    // IF A PROJECT ID IS NOT NULL THAT IS A GET REQUEST IS AVAILABLE , THE THIS PAGE SHOULD ACT AS A DEVELOPER VIEWING IT
    if( pId != null ){
        //STORE THE PROJECT ID IN SESSION
        session.setAttribute("projectId", pId);
        
        if(pId != ""){
             
            String query = "SELECT * FROM project p join used_for u on p.p_id = u.p_id WHERE p.p_id = "+pId+"";
             
             Db database = new Db();
             ResultSet result = database.select(query);
             
             String comp = null;
             try {
                if(result.next())
                  comp = result.getString("p_ids");
             } catch (SQLException ex) {
                 ex.getMessage();
                  //Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
             }
                 components = comp.split(",");
                 
                 invitee = true;
             }
       
    }else{
        
         Db database = new Db();
         
         String previousId = "SELECT p_id FROM project ORDER BY p_id desc";
         
         ResultSet result = database.select(previousId);
         //retrieve and incriment 1
         int prevId = 0;
         if(result.next()){
             prevId = result.getInt("p_id");
         }  
         
         nextId = prevId + 1;
        // out.println("<script> alert(\"new project\"); </script>");
         //CREATE A SESSION AND STORE THE VALUE;
         session.setAttribute("projectId", nextId);
    }       
       
    // String[] comp = message.split(",");
     String style = "";
     MyLinkedList imagesUrl = new MyLinkedList();
     
     for(int i = 0; i<components.length ; i++){
         
        String query = "SELECT * FROM page_compoment WHERE pc_id = "+components[i]+"";
             
        //BRING OUT ALL THE COMPONENTS CODE FROM THE DATABASE
             Db database = new Db();
             ResultSet result = database.select(query);
              
             try {
                while(result.next()){
                  style += result.getString("style");
                }
                  
             } catch (SQLException ex) {
                 ex.getMessage();
                  //Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
             } 
             
             //HOLD A LIST OF IMAGES URL
             
             String imagesQuery = "SELECT * FROM page_compoment pc join page_component_file pcf on pc.pc_id = pcf.pc_id and pc.pc_id = '"+components[i]+"'";
             ResultSet imagesResult = database.select(imagesQuery);
             
             try {
                while(imagesResult.next()){
                    imagesUrl.append(imagesResult.getString("image_url"));
                 }
              } catch (SQLException ex) {
                 ex.getMessage();
                  //Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
             } 
             
     }
     
     String beforeStyle = "<!DOCTYPE html>\n<html>\n<head>\n<title></title>\n<style type=\"text/css\">";
     String endOfStyle = "</style>\n</head>\n<body>";
     String header = new Header().getHeader(headerResult);
     String banner = new Banner().getBanner(bannerResult);
     String main = new Main().getMain(mainResult);
     String footer = new Footer().getFooter(footerResult);
     String afterFooter = "</body>\n</html>";
     
     String content = beforeStyle+style+endOfStyle+header+banner+main+footer+afterFooter;//out.print(codeToWrite);
     FileManage file = new FileManage();
     
     file.writeToFile("generated-code/temp/index.html", content);
      
     //COPY IMAGES
     FileCopying copyfiles = new FileCopying();
     
      Iterator it = imagesUrl.iterator();
      while(it.hasNext()){
        String imagepath = (String)it.next();
        String imageName = imagepath.substring(imagepath.lastIndexOf("\\"));
        copyfiles.copyImages(imagepath, "generated-code/temp"+"\\"+imageName);
      }
   
%>
<!DOCTYPE html>
<html>
<head>
    <title>Choose components.</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <!-- CSS Files -->
    <link rel="stylesheet" type="text/css" href="Assets/fonts/font-awesome/css/font-awesome.css">
    <!-- Bootstrap core CSS -->
    <link href="Assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="Assets/css/custom-style.css">
    <!-- Custom styles for this template --> 
    <link rel="stylesheet" type="text/css" href="Assets/css/material-kit.css">
   
    <style>
        .side-nav{
        background: url('Assets/images/side-nav-bg.jpg');
        width: 20%;
           height: 100vh;
        top: 0;
        left: 0;
        border-right: 2px solid rgba(0,161,230,0.6);
        }
        
        .show-note{
            position:relative;
            z-index: 100;
        }
        
        .popnote{
            font-size: 15px;
            width: 400px;
		height: 300px;
		position: absolute;
		top:65px;
		background-color: #f3f3f3;
		text-align: left;
		border-radius: 5px;
	box-shadow: 1px 30px 50px rgba(0,0,0,0.3);
            
        }
        
        .note-footer{
            width: 100%;
            bottom: 5px;
            height: 40px;
            background: #fff;
            position: absolute;
        }
        
        .popnote button{
            float:right;
            margin-top: 10px;
            margin-right:5px;
        }
        
        .font-size-13px{
            font-size:13px !important;
           
        }
        
        .popnote{
            transition:display .2s;
        }
        
        .hide-note{
            display: none;
        }
        
        .note-button{
            width: 60px;
            height: 60px;
            border-radius: 50%;
            padding: 0px;
            bckground:#ff6c00;
            
        }
        
        .note-signal{
		animation: note-signal 1s infinite;
	}
        
        @keyframes note-signal{
            0%{
                box-shadow:5px 5px 20px rgba(0,0,0, 0.3);     
            }            

            100%{
                box-shadow:25px 25px 40px rgba(0,0,0, 0.3); 
            }
        }
   
        
 
    </style>
        
</head>
<body style="background:#eeeeee;">
<div class="row">
		<div class="col-lg-12">
			<nav class="navbar navbar-expand-lg generator-nav"><div class="navbar-translate">
                               
                        <a id="generator-logo" class="navbar-brand" href="#0"></a>
	                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-label="Toggle navigation">
	                  <span class="sr-only">Toggle navigation</span>
	                  <span class="navbar-toggler-icon"></span>
	                  <span class="navbar-toggler-icon"></span>
	                  <span class="navbar-toggler-icon"></span>
	                </button>
	              </div>
	            <div class="container">
	              <!-- Brand and toggle get grouped for better mobile display -->
                      <p style="color:#fff; margin-top: 25px;">PROJECT TITLE: </p>
	              <!-- Collect the nav links, forms, and other content for toggling -->
	              <div class="collapse navbar-collapse">
	                <ul class="navbar-nav ml-auto">
                            
	                  <% if(!invitee){ %>
	                  <li class="nav-item">
                              <input id="componentsId" type="hidden" value="<% out.print(nextId); %>">
                              <a id="save-html-button" href="#pablo" style="height: 35px;font-size: 13px !important;font-weight: bolder !important;padding-top: 8px;" class="btn font-size-15px  btn-width-140px btn-round btn-color-blue margin-left-30px" style="margin-top: 8px;" data-toggle="dropdown">
	                     Save
	                    </a>
	                  </li>
                          <% }else{ %>
                            <li class="nav-item">
                              <input id="download-componentsId" type="hidden" value="<% out.print(components[0]+","+components[1]+","+components[2]+","+components[3]); %>">
                              <a id="download-button" href="#pablo" style="height: 35px;font-size: 13px !important;font-weight: bolder !important;padding-top: 8px;" class="btn font-size-15px  btn-width-140px btn-round btn-color-blue margin-left-30px" style="margin-top: 8px;" data-toggle="dropdown">
	                     Download
	                    </a>
	                  </li>
                          <% } %>
	                </ul>
	              </div>
	              <!-- /.navbar-collapse -->
	            </div>
	            <!-- /.container-->
	          </nav>

	          <div class="container">
	           
		          <div class="col-lg-12">
                               
                               <div class="side-nav" style="<% if(invitee){ out.print("display:none;"); }%>">
                                    <div class="side-nav-container">
                                        <h3>LEAVE NOTE</h3>
                                        <p style="color:#eeeeee;">
                                            You can leave note to someone who view this project. 
                                        </p>
                                        <div style="width: 100%; overflow: hidden;">
                                        <p id="drag-note-text">DRAP AND DROP THIS ORANGE BUTTON</p>
                                        <div id="note-button" class="btn"><i class="fal fa-sticky-note"></i></div>
                                        </div>
                                        <hr>
                                        <h3>INVITE DEVELOPER</h3>
                                        <p style="color:#eeeeee;">
                                            Submitted email wil recieve a link to this project.
                                        </p>
                                        <label>Email:</label><br>
                                        <input id="invitee-email" type="text" name="email">
                                        <input id="invite-submit" type="submit" value="Send">
                                        <span></span>
                                    </div>
		          	</div>
		          	
		          	 
                          </div>
                  </div>
                </div>
</div>
     
<!--project body--> 

<div id="main-project-container">
<div id="project-container"  style="<% if(invitee){ out.print("margin-left:10%;");}%>">
                  
    <script>
        var not_saved = true;
        
        //WHEN SUBMIT INVITAION IS CLICKED
      
        $("#invite-submit").on("click", function(){
            var email = $("#invitee-email").val();
            if(!not_saved){
            $.ajax({
                    url:"mail.jsp",
                    method:"POST",
                    data:{message:email},
                    success: function(data)
                    {
                        alert(data);
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {   
                        alert("Error while sending Email");
                        
                    }
                });
            }else{
                alert("Save Project Before invitation.");
            }
        });
        
        function sendInvitation(){
           
        }
        
        function showNote(id){
           //var note_container = $("#"+id).parent().attr("id");
           $("#"+id+" .popnote").toggleClass("hide-note");
           
        }
        
        function closeNote(id){
           var note_container = $("#"+id).parent().parent().attr("id");
           $("#"+note_container).toggleClass("hide-note");
        }
        
         //GET THE POSITION OF AN ELEMENT.
      function getOffset( el ) {
        var _x = 0;
        var _y = 0;
        while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
          _x += el.offsetLeft - el.scrollLeft;
          _y += el.offsetTop - el.scrollTop;
          el = el.offsetParent;
        }
        return { top: _y, left: _x };
      }
      
        function keepNote(noteId, buttonId){
          // var popover_body = $("#"+id).parent().parent().attr("id");
           //take the note and coordinate of the button and send throught ajax
         
        var note = $("#"+noteId).html(); 
       
           var x = getOffset( document.getElementById(buttonId) ).left; 
           var y = getOffset( document.getElementById(buttonId) ).top;
          
          
           if(!not_saved){
           $.ajax({
                    url:"note.jsp",
                    method:"POST",
                    data:{message:note,x:x,y:y},
                    success: function(data)
                    {
                        alert(data);
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {   
                        alert("Error while saving note");
                        
                    }
                });
            }else{
                alert("Save Project Before note");
            }
        }
    </script>
    <div class="centered-content">
    
    <!--HEADER COMPONENT--> <!--BANNER COMPONENT--> <!--MAIN COMPONENT--> <!--FOOTER COMPONENT-->
    <%
     // WHEN THE USER VIEWING THIS PAGE WAS INVITED 
        if( invitee ){
          // out.println();
           out.print("<iframe src=\""+pId+"\" name=\"iframe_a\"></iframe>");
           out.print(new Note().getNotes(pId));
        }else{
            
        }
    %>
    
</div>
</div>   
</div>
   
</body>
    <!-- Bootstrap core JavaScript -->
    <script src="Assets/vendor/jquery/jquery.min.js"></script>
    <script src="Assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="Assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom JavaScript for this theme -->
    <script src="Assets/js/scrolling-nav.js"></script>
 
    <script src="Assets/js/jquery-ui.js"></script>
    <script src="Assets/js/note.js"></script>
     
</html>