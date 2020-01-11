<%-- 
    Document   : newjsp
    Created on : 03-Sep-2018, 07:19:25
    Author     : HP PRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%    
      String file = "HTML-PAGE-GENERATOR.zip";  
      String filepath = "c:\\htmlpagegenerator\\";   
      response.setContentType("APPLICATION/OCTET-STREAM");   
      response.setHeader("Content-Disposition","attachment; filename=\"" + file + "\"");   
      
      java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + file);  
                
      int i;   
      while ((i=fileInputStream.read()) != -1) {  
        out.write(i);   
      }   
      fileInputStream.close();  
      
      out.print("we are here");
    %>   