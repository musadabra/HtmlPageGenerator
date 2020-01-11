/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
  $(document).ready(function(){
    
   
            $("#download-button").on("click", function(){
               var c_Ids = $("#download-componentsId").val();
               $("#loader").removeClass("display-none");
               $.ajax({
                    url:"././download.jsp",
                    method:"POST",
                    data:{message:c_Ids},
                    success: function(data)
                    {
                        location.href="complete-download.jsp";
                        $("#loader").addClass("display-none");
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {   
                        $("#loader").addClass("display-none");
                        alert("Error while downloading Project");
                        
                    }
                }); 
                
           });
           
    
    
           $("#save-button").on("click", function(){
               var c_Ids = $("#componentsId").val();
               $("#loader").removeClass("display-none");
                $.ajax({
                    url:"././save.jsp",
                    method:"POST",
                    data:{message:c_Ids},
                    success: function(data)
                    {
                        $("#loader").addClass("display-none");
                        alert(data);
                        not_saved = false;
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {   
                        $("#loader").addClass("display-none");
                        alert("Error while saving Project");
                        
                    }
                });
           });
           
        
        //NOTE
         //  A draggable element
        $("#note-button").draggable({
          helper : 'clone',
          containment: 'frame',
          stop: DropNote
         });

        //WHERE DROPABLE NOTE CAN BE DROPPED
         //Make element droppable
        $("#project-container").droppable({
	     drop: NotePanel
        });
        
 
         //Count p,img,H,button elements created
       
        var note = 1;
       
        function DropNote(ev, ui){
            
            //CHECK THE ID OF THE DRAGGABLE ELEMENT TO KNOW WHAT TO DROP
            //if(ui.draggable.attr("id") === "note-button")
            //{
              var pos=$(ui.helper).offset();
              var noteId = "note"+note;
              
              var notecode = "<button id=\""+noteId+"\" type=\"button\" class=\"btn font-size-13px note-signal note-button\" onclick=\"showNote('show-note"+note+"')\">Note</button><div id=\"show-note"+note+"\" class=\"show-note\"><div class=\"popnote hide-note\"><div class=\"arrow\" style=\"top: 42px;\"></div>"
       +" <h3 class=\"popover-header\">Popover on right</h3>"
       +" <div id=\""+noteId+"-body\" contenteditable=\"true\" class=\"popover-body\">You can leave note here</div> "
      +" <div class=\"note-footer\">"
          +"  <button id=\"close-"+noteId+"\" style=\"padding: 5px 15px;margin-right: 10px;\" class=\"btn font-size-13px\" onClick=\"showNote('show-note"+note+"')\">Close</button>"
         +"   <button  style=\"padding: 5px 15px;background: #00a1e6;\" class=\"btn font-size-13px\" onclick=\"keepNote('"+noteId+"-body','"+noteId+"')\">Save</button>"
       +" </div>"
  +"  </div>"
  +"  </div>";
              //"<div id=\""+noteId+"\" class=\"btn writable-note\" data-toggle=\"popover\" data-placement=\"right\" onClick=\"\">NOTE</div>"
               $("#main-project-container").append(notecode);
              
              $("#"+noteId).css({"position":"absolute","left":pos.left,"top":pos.top,"z-index":100});
              $("#show-note"+note).css({"position":"absolute","left":pos.left,"top":pos.top+10,"z-index":100});
               
              $("#"+noteId).removeClass("drag");
             ++note;
              //When an existiung object is dragged
                $("#"+noteId).draggable({
                    containment: 'parent',
                    stop:function(ev, ui) {
                    	var pos=$(ui.helper).offset();
                    	console.log($(this).attr("id"));
			console.log(pos.left)
                        console.log(pos.top)
                    }
                });
            
            /*
           
            console.log(ui.position.left+":"+ui.position.top);
            $(this).append("<div id=\""+noteId+"\" class=\"writable-note \" onClick=\"\" style=\"\">NOte</div>");
            ++note;
            var x = getOffset( document.getElementById(noteId) ).left; 
            var y = getOffset( document.getElementById(noteId) ).top;
            alert(x+":"+y);
        */
          
           // }
        
      }
      
      function NotePanel(ev, ui) {
            
	    if (ui.helper.attr('id') == "project-container"){
		note++;
		var element=$(ui.draggable).clone();
		element.addClass("tempclass");
		$(this).append(element);
		$(".tempclass").attr("id","noteId"+note);
		$("#noteId"+note).removeClass("tempclass");

		//Get the dynamically item id
		draggedNumber = ui.helper.attr('id').search(/drag([0-9])/)
		itemDragged = "dragged" + RegExp.$1
		console.log(itemDragged)

		$("#noteId"+note).addClass(itemDragged);
	 }
       }
    
     

      
      //THIS FUNCTION TAKE X,Y CORDINATE WHERE NOTE IS KEPT AND NOTE WRITTEN AND SAVE IN THE DB
      
      
      //DELETE NOT
      function deleteNote(noteId){
          
      }
     
     function showNote(id){
           //var note_container = $("#"+id).parent().attr("id");
           $("#"+id+" .popnote").toggleClass("hide-note");
           
        }
     
    });
