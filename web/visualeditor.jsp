<%-- 
    Document   : visualeditor
    Created on : 24-Jul-2018, 23:32:13
    Author     : HP PRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="codeGenerator.*" %>
<%@ taglib prefix = "portlet" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
    out.println(new Header().getHeaders());
%>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">                    
                        <div class="col-lg-1">
                        <div class="tools-container">
                             <ul>
                                 <li><i id="media-library" class="fa fa-text-o" onclick="fetchimages();">p</i></li>
                                 <script>
                                      //WHEN THE MEDIA LIBRARY IS OPENNED
                                      var mediaIsFetched = true;
         
                                      function fetchimages(id)
                                      {
                                          
                                          $(".media-content").toggleClass("show-up");
             
                                            //TO EXERCUTE THE FETCH FUNCTION
                                            if(mediaIsFetched){
                                               loadMediaImages("Assets\\images\\");
                                               mediaIsFetched = false;
                                           }
                                      }
                                      
                                       function loadMediaImages(images_folder_url)
                                       {
                                      
                                        $.ajax({
                                         url:"fetch-media-library.jsp",
                                         method:"POST",
                                         data:{imagesFolderUrl:images_folder_url},
                                         success:function(data)
                                         { 
                                          $('.media-images').html(data);
                                         },
                                         error: function(data)
                                         {
                                              alert("error");
                                         }
                                        });
                                        
                                       }
                                 </script>
                             </ul>
                        </div>
                    </div>
                    <div class="col-lg-11">
                        <div class="media-content">
                            <div class="media-header">
                                <h3>Media Library</h3>
                                <i class="fa fa-close"></i>
                            </div>
                            <div class="choosefile-container">
                                <h1>DRAG AND DROP IMAGE HERE</h1>
                                <hr><P>OR</P>
                                <div class="box">
                                    <form id="upload-form" method="post" enctype="multipart/form-data">
                                        <input type="file" name="files" id="file-2" class="inputfile inputfile-2" data-multiple-caption="{count} files selected" multiple />
					<label for="file-2"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
                                        
                                    </form>
                                    <script>
                                        
                                        // Variable to store your files
                                        var files;

                                        // Add events
                                        $('#file-2').on('change', prepareUpload);

                                        // Grab the files and set them to our variable
                                        function prepareUpload(event)
                                        {
                                          files = event.target.files;
                                          $('#upload-form').submit();
                                        }
                                        
                                       $('#upload-form').on('submit', uploadFiles);

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
                                    </script>
                                </div>
                            </div>
                            <div class="media-images">
                              <!-- 
                                <div id="image1" class="media-image" style="background:url('Assets/images/coffee1.jpg');"><i class="fa fa-close media-image-delete-icon"></i></div>
                                <div id="image2" class="media-image" style="<c:url value="/Assets/images/coffee1.jpg"></c:url>"></div>
                                 <div id="image3" class="media-image" style="background:url('<%=request.getContextPath()%>/Assets/images/coffee1.jpg');"></div>
                                <div class="media-image" style="background:url('Assets/images/coffee1.jpg');"></div>
                                <div class="media-image" style="background:url('Assets/images/2.png');"></div>
                                <div class="media-image" style="background:url('Assets/images/1.jpg');"></div>
                            --></div>
                            <div class="media-footer">
                                <i class="fa fa-close
                                   "></i>
                            </div>
                        </div>
                    </div>
                   
                    <h1>Download File Here</h1>
                    <a href="download.jsp">Click</a>

                </div>
            </div> 
        </div       
    </body>
    <script src="Assets/js/media-library.js"></script>
    <script src="Assets/js/custom-file-input.js"></script>
    <script src="Assets/js/jquery.form.js"></script>
    <script>
       
       $(function(){
        
          
         });
         
         
        
        
         /*
         $("#media-library").on("click", function(){
                alert("ehy");
             $(".media-content").toggleClass("show-up");
             
             //TO EXERCUTE THE FETCH FUNCTION
             if(mediaIsFetched){
                load_media_images("Assets/images/");
                mediaIsFetched = false;
            }
            
         }); */
         
        
    </script>
</html>
