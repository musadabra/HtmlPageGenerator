<%-- 
    Document   : Output
    Created on : 25-Jun-2018, 17:48:00
    Author     : Musa Dabra
--%>
<%@ page import="Authentication.Authentication, page.Page" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Get user details.
    Authentication auth = new Authentication();
    String url = request.getRequestURI();
    String pageName = url.substring(url.lastIndexOf("/"));
    String user = (String)session.getAttribute("userId");
   if((user != null ) && pageName != "login.jsp"){ 
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><% out.println(new Page().getTitle("pagename")); %></title>
     <!-- Bootstrap Core CSS -->
      <!-- CSS Files -->
    <link rel="stylesheet" type="text/css" href="Assets/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="Assets/css/custom-style.css">
    <link href="Assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--<script type="text/javascript" src="assets/js/jquery-1.10.2.min.js"></script>-->
    <script src="Assets/js/jquery.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="Assets/js/bootstrap.min.js"></script>
</head>
<body>

<%
    }else{
        //When user is not logged in.
        // New location to be redirected
        String site = new String("login.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);      
   }
%>