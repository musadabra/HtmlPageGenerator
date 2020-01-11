/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 $(function(){
                 $("#media-library").on("click", function(){
                     $("#media-library").toggleclass("show-up");
                 });  
                 
                 $(".media-image").on("mouseenter", function(){
                     var id = $(this).attr('id');
                     $('#'+id+" i").addClass("media-image-delete-icon-show");        
                 });
                 
                 $(".media-image").on("mouseleave", function(){
                     var id = $(this).attr('id');
                     $('#'+id+" i").removeClass("media-image-delete-icon-show");        
                 });
                 
                 $(".media-image-delete-icon").on("click",function(){
                     alert("delete image");
                 });
                 
});


