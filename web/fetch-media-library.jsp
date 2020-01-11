<%-- 
    Document   : fetch-media-library
    Created on : 26-Jul-2018, 11:43:36
    Author     : Musa Dabra
--%>
<%@page import="java.net.URI"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.nio.file.*" %>
<% 
 // File file = new File("C:\\test\\projects\\1\\Assets\\images");
 //String url = request.getContextPath();
  File file = new File("/Assets/images");
  File[] fileslist = file.listFiles();
//  int imageID = 0;
 // String outputImages = "";
 // URI uri;
    String image = "<img src=\"Assets/images/coffee2.JPG\" width=\"593\" height=\"412\" alt=\"coffee2\"/>";
 out.print(image);
 out.print(request.getContextPath());
 out.println(file.exists());


/*
  for(int i = 0; i < fileslist.length; i++){
     // uri = new URI(fileslist[i].getAbsolutePath());
     // String pathbefore = fileslist[i].getAbsolutePath();
      //out.println(pathbefore);
      //String regex = "\\\\";
     // String replacement = "/";
     // String path = pathbefore.replaceAll(regex, replacement);
      //outputImages += "<img id=\"image"+imageID+"\" class=\"media-image\" src=\""+fileslist[1]+"\" width=\"300\" height=\"300\" alt=\"coffee1\"/>";
//      ++imageID;
     
  }
*/
   // out.println(outputImages);
%>    