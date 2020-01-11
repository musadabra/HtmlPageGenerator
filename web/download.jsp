<%-- 
    Document   : download
    Created on : 29-Jul-2018, 11:51:03
    Author     : HP PRO
--%>
<%@page import="download.FolderZipper"%>
<%@page import="Cosc301.MyLinkedList"%>
<%@page import="Cosc301.Iterator"%>
<%@page import="download.FileCopying"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="codeGenerator.Footer"%>
<%@page import="codeGenerator.Main"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Db"%>
<%@page import="codeGenerator.Header"%>
<%@page import="codeGenerator.Banner"%>
<%@page import="codeGenerator.FileManage"%>
<%@page import="demotest.download" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
     String message = (String)request.getParameter("message");
     String projectId = (String)session.getAttribute("projectId");
   
     String style = "";
     String[] comp = message.split(",");
     
     MyLinkedList imagesUrl = new MyLinkedList();
     
     for(int i = 0; i<comp.length ; i++){
         
        String query = "SELECT * FROM page_compoment WHERE pc_id = "+comp[i]+"";
             
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
             
             String imagesQuery = "SELECT * FROM page_compoment pc join page_component_file pcf on pc.pc_id = pcf.pc_id and pc.pc_id = '"+comp[i]+"'";
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
     
     //out.print(""+comp[2]);
    
     String beforeStyle = "<!DOCTYPE html>\n<html>\n<head>\n<title></title>\n<style type=\"text/css\">";
     String endOfStyle = "</style>\n</head>\n<body>";
     String header = new Header().getHeader(comp[0]);
     String banner = new Banner().getBanner(comp[1]);
     String main = new Main().getMain(comp[2]);
     String footer = new Footer().getFooter(comp[3]);
     String afterFooter = "</body>\n</html>";
     
     String content = beforeStyle+style+endOfStyle+header+banner+main+footer+afterFooter;
     //out.print(content);
     //System.out.print(content);
     //out.print("go check");
     FileManage filemanager = new FileManage();
     filemanager.createProjectFile(projectId, content);
     
     String foldername = "C:\\htmlpagegenerator\\"+projectId;
     String filename = foldername+"\\index.html";
     filemanager.writeToFile(filename, content);
     
     //COPYING IMAGES
     FileCopying copyfiles = new FileCopying();
     
      Iterator it = imagesUrl.iterator();
      while(it.hasNext()){
        String imagepath = (String)it.next();
        String imageName = imagepath.substring(imagepath.lastIndexOf("\\"));
        copyfiles.copyImages(imagepath, foldername+"\\"+imageName);
      }
     
      //ZIP FOLDER, MAKE IT READY FOR DOWNLOAD.
     // String fileZipName = "c:\\htmlpagegenerator\\HTML-PAGE-GENERATOR.zip";
      //"+projectId
      String fileZipName = "c:\\htmlpagegenerator\\"+projectId+".zip";
      try{
      new FolderZipper().zipFolder(foldername, fileZipName);
      }catch(Exception ex){
          ex.getMessage();
      }
      
      
      //WORK ON DOWNLOAD AND DO SO
   
%> 
