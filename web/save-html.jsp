<%@page import="codeGenerator.FileManage"%>
<%@page import="download.FileCopying"%>
<%@page import="java.io.File"%>

<% 
   String newFolder = (String)request.getParameter("message");
   FileManage file = new FileManage();
     
   file.createFolder("generated-code/"+newFolder);
   //file.createFile("generated-code/"+newFolder+"/index.html"); 
   
   File folder = new File("C:\\Users\\HP PRO\\Documents\\NetBeansProjects\\HTMLPAGEBUILDER\\web\\generated-code\\temp"); 
   for ( File fileEntry : folder.listFiles()) {
       // fileEntry.getName() 
       //new FileCopying().copyFile(fileEntry.getAbsolutePath(), "C:\\Users\\HP PRO\\Documents\\NetBeansProjects\\HTMLPAGEBUILDER\\web\\generated-code"+newFolder+"\\");
       new FileCopying().copyImages(fileEntry.getAbsolutePath(), "C:\\Users\\HP PRO\\Documents\\NetBeansProjects\\HTMLPAGEBUILDER\\web\\generated-code"+newFolder+"\\");
   }
%>