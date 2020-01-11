<%-- 
    Document   : developer-preview
    Created on : 30-Aug-2018, 01:44:27
     Author     : MUSA DABRA
--%>
<%@ include file="header.jsp" %>
<%@ page import="codeGenerator.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Developer: Projects</title>
        <style>
            #dev-page-background{
                background: url('Assets/images/background_2.jpg');
                height: 400px;
                position: fixed;
                top: 0px;
                left: 0px;
                width: 100%;
            }
            
            .margin-top-270px{
                 margin-top: 270px;
            }
            
            .project-box{
                //width: 300px;
                width: 97%;
                float: left;
                height: 300px;
                position: relative;
                background-image: url(Assets/images/page.JPG);
                background-repeat: no-repeat;
                background-size: contain;
                box-shadow: 4px 1px 20px rgba(0,0,0,.2);
                border-radius: 10px;
            }
            
            .inner-project-box{
                width: 94%;
                height: 30%;
                
                position: absolute;
                top: 68%;
                left: 0px;
                margin-left: 3%;
                
                color: #666;
            }
            
            .margin-right-1pc{
                margin-right:1%;
            }
            
        </style>
    </head>
    <body style="background:#eeeeee;">
    <div class="row">
		<div class="col-lg-12">
			<nav class="navbar navbar-expand-lg generator-nav"><div class="navbar-translate">
                               
                        <a id="generator-logo" class="navbar-brand" href="#0"></a>
	                
	              </div>
	            <div class="container">
	              <!-- Brand and toggle get grouped for better mobile display -->
                      <p style="color:#fff; margin-top: 25px;">PROJECT TITLE: </p>
	              <!-- Collect the nav links, forms, and other content for toggling -->
	              <div class="collapse navbar-collapse">
	                <ul class="navbar-nav ml-auto">
                            
	                 
	                  <li class="nav-item">
                              <input id="componentsId" type="hidden" value="">
                              <a id="save-button" href="#pablo" style="height: 35px;font-size: 13px !important;font-weight: bolder !important;padding-top: 8px;" class="btn btn-width-140px btn-round btn-color-blue margin-left-30px" data-toggle="dropdown">
	                     Save
	                    </a>
	                  </li>
                         
	                </ul>
	              </div>
	              <!-- /.navbar-collapse -->
	            </div>
	            <!-- /.container-->
	          </nav>

                </div>
        <div id="dev-page-background" class=""></div>
        </div>
        <div class="row">
            <div class="container">
                <div class="col-lg-12 margin-top-270px">
                    <a>
                         <div class="col-lg-4 margin-right-1pc project-box">
                        <div class="inner-project-box">
                            PROJECT NAME: Unknown
                            <p>OWNER:<% out.print(" "+session.getAttribute("username")); %></p>
                            
                        </div>
                    </div>
                    </a>
                   
                    <div class="col-lg-4 margin-right-1pc project-box">
                        <div class="inner-project-box">lorem ipsum dolet lorem ipsum dolet lorem ipsum dolet </div>
                    </div>
                    
                </div>
            </div>
        </div>

    </body>
</html>