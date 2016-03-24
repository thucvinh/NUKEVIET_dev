<!-- BEGIN: main -->

<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.carousel.css" rel="stylesheet" media="screen" />
<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.theme.css" rel="stylesheet" media="screen" />
<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.transitions.css" rel="stylesheet" media="screen" />
<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/owl.carousel.min.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
 
  var owl = $("#owl-demo");
 
  owl.owlCarousel({
	autoPlay:3000,
    navigation : false,
    singleItem : true,
    transitionStyle : "fade"
	//transitionStyle : "backSlide"
	//transitionStyle : "goDown"
	//transitionStyle : "fadeUp"
  });
 
});
</script>
	
<div id="owl-demo" class="owl-carousel owl-theme">
      <!-- BEGIN: loop -->
        <div class="item">
            <div class="image">
                <a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt="" class="img-responsive" /></a>
            </div>
        </div>
		<!-- END: loop -->
</div> 
<!-- END: main -->
