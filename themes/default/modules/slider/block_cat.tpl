/**
 * @Project NUKEVIET 4.x
 * @Author Pa Software Solutions.Ltd  (contact@3sacmau.vn)
 * @Copyright (C) 2014 Pa Software Solutions.Ltd. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 5/8/2014 07:25
 */
<!-- BEGIN: main -->

<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/slider.css" />

		<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/slider.js"></script>
		<script type="text/javascript">$(document).ready(function(){
    $.UnoSlider.defaults = {
        tooltip: true,
        indicator: { autohide: false },
        navigation: { autohide: true },
        slideshow: { hoverPause: true, continuous: true, timer: true, speed: 3, infinite: true, autostart: true },
        responsive: true,
        responsiveLayers: false,
        preset: ['chess', 'flash', 'spiral_reversed', 'spiral', 'sq_appear', 'sq_flyoff', 'sq_drop', 'sq_squeeze', 'sq_random', 'sq_diagonal_rev', 'sq_diagonal', 'sq_fade_random', 'sq_fade_diagonal_rev', 'sq_fade_diagonal', 'explode', 'implode', 'fountain', 'blind_bottom', 'blind_top', 'blind_right', 'blind_left', 'shot_right', 'shot_left', 'alternate_vertical', 'alternate_horizontal', 'zipper_right', 'zipper_left', 'bar_slide_random', 'bar_slide_bottomright', 'bar_slide_bottomright', 'bar_slide_topright', 'bar_slide_topleft', 'bar_fade_bottom', 'bar_fade_top', 'bar_fade_right', 'bar_fade_left', 'bar_fade_random', 'v_slide_top', 'h_slide_right', 'v_slide_bottom', 'h_slide_left', 'stretch', 'squeez', 'fade'],
        order: 'random',
        block: {
            vertical: 10,
            horizontal: 4
        },
        animation: {
            speed: 500,
            delay: 50,
            transition: 'grow',
            variation: 'topleft',
            pattern: 'diagonal',
            direction: 'topleft'
        }
    };

    var slider = $("#unoslider").unoslider();
});</script>

<div class="slider-container">
<ul class="unoslider" id="unoslider" style="left:0px !important;width:100% !important">
<div id="responsive-ribbon"></div>
  <!-- BEGIN: loop -->
<li> <a href="{ROW.link}" title="{ROW.title}"><img  src="{ROW.thumb}" />
</a>
</li>
<!-- END: loop -->
</ul>
</div>


<!-- END: main -->
