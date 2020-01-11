<%-- 
    Document   : generator
    Created on : 25-Jun-2018, 00:04:33
    Author     : MUSA DABRA
--%>
<%@ include file="header.jsp" %>
<%@ page import="codeGenerator.*" %>
<!--
<!DOCTYPE html>
<html>
<head>
    <title>Choose components.</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- CSS Files 
    <link rel="stylesheet" type="text/css" href="Assets/fonts/font-awesome/css/font-awesome.css">-->
    <!-- Bootstrap core CSS 
    <link href="Assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="Assets/css/custom-style.css">-->
    <!-- Custom styles for this template --> 
<!--
</head>
<body>

-->
<div id="bg-image" class="content background-image">
	<div id="balloon"></div>
</div>
	<div class="row">
		<div class="col-lg-12">
			<nav class="navbar navbar-expand-lg generator-nav">
	            <div class="container">
	              <!-- Brand and toggle get grouped for better mobile display -->
	              <div class="navbar-translate">
	                <a id="generator-logo" class="navbar-brand" href="#0"></a>
	                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-label="Toggle navigation">
	                  <span class="sr-only">Toggle navigation</span>
	                  <span class="navbar-toggler-icon"></span>
	                  <span class="navbar-toggler-icon"></span>
	                  <span class="navbar-toggler-icon"></span>
	                </button>
	              </div>
	              <!-- Collect the nav links, forms, and other content for toggling -->
	              <div class="collapse navbar-collapse">
	                <ul class="navbar-nav ml-auto">
	                  <li class="nav-item">
	                    <a id="head-link" href="#headers" class="nav-link js-scroll-trigger">
	                      Header
	                    </a>
	                  </li>
	                  <li class="nav-item">
	                    <a id="banner-link" href="#banners" class="nav-link js-scroll-trigger">
	                      Banner
	                    </a>
	                  </li>
	                  <li class="nav-item">
	                    <a id="main-link" href="#maincontent" class="nav-link js-scroll-trigger">
	                      Main Content
	                    </a>
	                  </li>
	                  <li class="nav-item">
	                    <a id="footer-link" href="#footers" class="nav-link js-scroll-trigger">
	                      Footer
	                    </a>
	                  </li>
	                  <li class="nav-item">
                              <a href="#pablo" class="btn btn-rose btn-raised btn-height-35px btn-width-140px btn-round btn-color-blue margin-left-30px" style="margin-top: 8px;" data-toggle="dropdown">
	                     Save
	                    </a>
	                  </li>
	                </ul>
	              </div>
	              <!-- /.navbar-collapse -->
	            </div>
	            <!-- /.container-->
	          </nav>

	          <div class="container">
	          
		          <div class="col-lg-12">

		          	<div class="side-nav">
		          		<ul>
		          			<li class="side-nav-item js-scroll-trigger"><a href="#headers">Header</a></li>
		          			<li class="side-nav-item js-scroll-trigger active"><a href="#banners">Banner</a></li>
		          			<li class="side-nav-item js-scroll-trigger"><a href="#maincontent">Main Content</a></li>
		          			<li class="side-nav-item js-scroll-trigger"><a href="#footers">Footer</a></li>
		          			<li class="side-nav-item js-scroll-trigger" id="finish-link"><a href="#finish">Finish</a></li>
		          		</ul>
		          	</div>
		          	<!-- Conponent Description -->
		          	<div class="col-lg-2"></div>
		          	
		          	<div class="generator-navs">
		          		<div id="leftnav" class="left-nav"><img src="Assets/images/arrow-circle-left-solid.svg"></div>
		          		<div id="rightnav" class="right-nav"><img src="Assets/images/arrow-alt-circle-right-solid.svg"></div>
		          	</div>

                                <form action="preview.jsp">
                                <!-- HEADERS -->
		          	<div id="headers" class="headers-adjust"></div>

		          	<div id="header-slider" class="slider slider1">
		          		
		          		<!-- Conponents -->
                                    <ul>
                                        <% out.println(new Header().getHeaderUrls()); %>
                                    </ul>
                                </div>
                                    
                                <!-- Banner -->
		          	<div id="banners" class="banners-adjust"> </div>
		          	<div id="banners-slider" class="slider Banner slider2">
		          		
		          		<!-- Conponents -->

		          		<ul>    
                                        
                                        <% out.println(new Banner().getBannersUrls()); %>
                                        </ul>
                                </div>
                                        
                                <!-- main -->
		          	<div id="maincontent" class="main-content-adjust"></div>
		          	<div id="maincontent-slider" class="slider main-content-adjust slider3">
		          		
		          	<!-- Conponents -->

                                         <!-- Conponents -->

		          		<ul>    
                                        
                                        <% 
                                        out.println(new Main().getMainsUrls()); %>
                                        </ul>
                                </div>
                                 
                                <!-- Footer -->
		          	<div id="footers" class="footers-adjust"></div>
		          	<div id="footers-slider" class="slider footer-adjust slider4">
		          		
		          	<!-- Conponents -->
                                        <ul>    
                                        
                                        <% out.println(new Footer().getFootersUrls()); %>
                                        </ul>
                                </div>

		          	<!-- Finish -->
		          	<div id="finish" class="finish-adjust"></div>
		          	<div id="finish-slider" class="slider finish-adjust">	
                                    <div class="col-lg-12">
                                        <div class="finish-container"> 
			           			<h1>Finished !</h1>
                                                        <input class="btn btn-height-35px btn-width-140px btn-round btn-color-blue" type="submit" value="Preview">
			           			<p>Take a look at your choises as a complete page</p>
			                </div> 
		          	    </div>
		          	</div>
                                </form>
		          </div>
	          </div>
	           
		</div>
	</div>


    <!-- Bootstrap core JavaScript -->
    <script src="Assets/vendor/jquery/jquery.min.js"></script>
    <script src="Assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="Assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom JavaScript for this theme -->
    <script src="Assets/js/scrolling-nav.js"></script>


    <script type="text/javascript">


       
    	$(window).scroll(function(){

        var wScroll = $(this).scrollTop();
        //var bg_scroll_to = 0; 
        var balloon_scroll_to = 130;

        //var xscroll

        if(wScroll > 0 ){
			
            bg_scroll_to = wScroll * 0.01;
            balloon_scroll_to = wScroll * 0.5;

            $('#bg-image').css({
            	
                'top': '-'+wScroll*0.01+'px'
            });
        }

        var left_scroll =  $(this).scrollLeft();
        var left = 1300;

        if(left_scroll > 0){

            left -= left_scroll*0.5;

			$('#balloon').css({
                'left': left+'px'
            });

            $('#bg-image').css({
                'left': '-'+left_scroll*0.1+'px'
            });


        }


    });
	var headers_elementTop = $("#header-slider").position().top;
	var banners_elementTop = $("#banners-slider").position().top;
	var footers_elementTop = $("#footers-slider").position().top;
	var maincontent_elementTop = $("#maincontent-slider").position().top;

	//ON CLICK OF NAVIGATION BUTTON
	$("#leftnav").click(function(){
		prev();		
	});

    $('#rightnav').on('click', function(){
        nex();    
    });


    //TRIGGER THE EVENTS ON NAV LINKS USING WHEN CHECK BUTTONS A CLICKED
    var number_of_click = 1;
    $(".choisebutton").click(function(){

    	if (number_of_click == 1) {
    		$("#banner-link").trigger("click");
    	}else if (number_of_click == 2) {
    		$("#main-link").trigger("click");
    	}else if (number_of_click == 3) {
    		$("#footer-link").trigger("click");
    	}else if (number_of_click == 4) {
    		$("#finish-link").trigger("click");
    	}
    	
    	++number_of_click;
    });
    
	
    //POINTER NEXT_INDEX PREVIOUS INDEX
    var next_index = 1;
    var pointer = 0;
    var previous_index =-1;

    var left_scroll_px = 40;
    var right_scroll_px = 40;
    var total_scrollX = 0;

     nex();
    // previous();

    function nex(){
 		//alert(pointer);
    	//TO DISPLAY THE LEFT NAVIGATION
    	//alert("pointer:"+pointer+" next:"+next_index+" previous"+previous_index);

       	if (pointer > 0) {
			$("#leftnav").removeClass("display-none");
    	}else if (pointer < 1){
    		//HIDE THE LEFT NAV
    	    $("#leftnav").addClass("display-none");
    	}
    	

    	var viewportTop = $(window).scrollTop();
		var viewportBottom = viewportTop + $(window).height();

		if (viewportBottom > footers_elementTop) {
			slider_on_viewport = 4;
			//console.log(slider_on_viewport);
		}else if (viewportBottom > maincontent_elementTop) {
			slider_on_viewport = 3;
			//console.log(slider_on_viewport);
		}else if (viewportBottom > banners_elementTop) {
			slider_on_viewport = 2;
			//needed = 2;
			//console.log(slider_on_viewport);
		}else if (viewportBottom > headers_elementTop) {
			slider_on_viewport = 1;
			//console.log(slider_on_viewport);
		}

		//BECAUSE THE PAGE IS NOT SCROLLED WE CANT DETERMING THE SLIDER ON THE VIEW PORT
    	//FOR THAT REASON WE ARE GOING TO ASSUME THAT WE ARE VIEWING THE SLIDER
    	if (viewportTop < 1) {
			slider_on_viewport = 1;
    	}

    	//COUNT ELEMENTS LIST OF ITEMS IN THE SLIEDER
		var items = 0;
		$(".slider"+slider_on_viewport+" li").each(function(index){
		   items++;
		});

   
    	if ( next_index == items){
    		$("#rightnav").addClass("display-none");
    	}

    	if(pointer == 0){
    		//ON FIRST SLIDE
    		//$(".slider"+slider_on_viewport+" li").eq(pointer).addClass("slide-in");
    		$(".slider1 li").eq(pointer).addClass("slide-in");
    		$(".slider2 li").eq(pointer).addClass("slide-in");
    		$(".slider3 li").eq(pointer).addClass("slide-in");
    		$(".slider4 li").eq(pointer).addClass("slide-in");
    	}else{
    		//ON 2ND SLIDE

    		$(".slider"+slider_on_viewport+" li").eq(pointer-1).addClass("slide-out");
    		$(".slider"+slider_on_viewport+" li").eq(pointer-1).removeClass("slide-in");
    		$(".slider"+slider_on_viewport+" li").eq(pointer-1).removeClass("slide-back-in");

    		$(".slider"+slider_on_viewport+" li").eq(previous_index).removeClass("slide-out");
    		$(".slider"+slider_on_viewport+" li").eq(pointer).addClass("slide-in");
    	}

    	//SCROLL RIGHT


    	next_index++;
    	pointer++;
    	previous_index++;


    }


    function prev(){
    	// TO HIDE THE RIGHT NAVIGATION
    	//alert(previous_index+":"+pointer);
    	//alert("previous:"+previous_index+" pointer:"+pointer);

    	if (previous_index == 0) {
			$("#leftnav").addClass("display-none");
    	}else{
			$("#rightnav").removeClass("display-none");    		
    	}

    	var viewportTop = $(window).scrollTop();
		var viewportBottom = viewportTop + $(window).height();

		if (viewportBottom > footers_elementTop) {
			slider_on_viewport = 4; 
			//console.log(slider_on_viewport);
		}else if (viewportBottom > maincontent_elementTop) {
			slider_on_viewport = 3;
			//console.log(slider_on_viewport);
		}else if (viewportBottom > banners_elementTop) {
			slider_on_viewport = 2;
			//needed = 2;
			//console.log(slider_on_viewport);
		}else if (viewportBottom > headers_elementTop) {
			slider_on_viewport = 1;
			//console.log(slider_on_viewport);
		}

		//BECAUSE THE PAGE IS NOT SCROLLED WE CANT DETERMING THE SLIDER ON THE VIEW PORT
    	//FOR THAT REASON WE ARE GOING TO ASSUME THAT WE ARE VIEWING THE SLIDER
    	if (viewportTop < 1) {
			slider_on_viewport = 1;
    	}

    	//COUNT ELEMENTS LIST OF ITEMS IN THE SLIEDER
		var items = 0;
		$(".slider"+slider_on_viewport+" li").each(function(index){
		   items++;
		});


    	if(pointer > 0){
    		$(".slider"+slider_on_viewport+" li").eq(pointer-1).removeClass("slide-in");
	    	$(".slider"+slider_on_viewport+" li").eq(pointer-1).addClass("slide-back-out");

	    	$(".slider"+slider_on_viewport+" li").eq(previous_index-1).addClass("slide-back-in");

	    	$(".slider"+slider_on_viewport+" li").eq(pointer-1).removeClass("slide-back-in");
			$(".slider"+slider_on_viewport+" li").eq(pointer-1).removeClass("slide-back-out");

	    	previous_index--;
	    	pointer--;
	    	next_index--;

    	}

    	
    }


    </script>

</body>
</html>