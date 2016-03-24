
<!-- BEGIN: main -->
<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.carousel.css" rel="stylesheet" media="screen" />

<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.theme.css" rel="stylesheet" media="screen" />

<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/owl.carousel.min.js"></script>

<script type="text/javascript">
	 $(document).ready(function() {
  var owl = $("#owl-doitac");
  owl.owlCarousel({
      itemsCustom : [
        [0, 1],
        [450, 2],
        [600, 3],
        [700, 4],
        [1000, 5],
        [1200, 6],
        [1400, 7],
        [1600, 8]
      ],
      navigation : true
  });
});
</script>
<div id="owl-doitac" class="owl-carousel owl-theme">
   <!-- BEGIN: loopdoitac -->
   <div class="item">
		<a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt="{ROW.title}" width="{ROW.blockwidth}" style="margin-bottom:10px" class="img_doitac"/></a>
   </div>
   <!-- END: loopdoitac -->  
</div>
<!-- END: main -->
