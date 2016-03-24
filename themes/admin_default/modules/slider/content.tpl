<!-- BEGIN: main -->
<!-- BEGIN: error -->
<div class="alert alert-danger">{error}</div>
<!-- END: error -->
<link type="text/css" href="{NV_BASE_SITEURL}js/ui/jquery.ui.core.css" rel="stylesheet" />
<link type="text/css" href="{NV_BASE_SITEURL}js/ui/jquery.ui.theme.css" rel="stylesheet" />
<link type="text/css" href="{NV_BASE_SITEURL}js/ui/jquery.ui.menu.css" rel="stylesheet" />
<link type="text/css" href="{NV_BASE_SITEURL}js/ui/jquery.ui.autocomplete.css" rel="stylesheet" />
<link type="text/css" href="{NV_BASE_SITEURL}js/ui/jquery.ui.datepicker.css" rel="stylesheet" />

<form class="form-inline m-bottom" action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" enctype="multipart/form-data" method="post" class="confirm-reload">
	<div class="row"><div class="col-xs-24 col-sm-24 col-md-24">
			<table class="table table-striped table-bordered">
				<col class="w200" />
				<col />
				<tbody>
				
				
					<tr>
						<td><strong>{LANG.content_cat}</strong></td>
						<td >
						<table class="table table-striped table-bordered table-hover">
									<tbody>
										<!-- BEGIN: catid -->
										<tr>
											<td style="width:350px"><input style="margin-left: {CATS.space}px;" type="checkbox" value="{CATS.catid}" name="catids[]" class="news_checkbox" {CATS.checked} {CATS.disabled}> {CATS.title} </td>
											<td style="width:50px"><input id="catright_{CATS.catid}" style="{CATS.catiddisplay}" type="radio" name="catid" title="{LANG.content_checkcat}" value="{CATS.catid}" {CATS.catidchecked}/></td>
										</tr>
										<!-- END: catid -->
									</tbody>
								</table>
						
						</td>
					</tr>
					
					
					
					
					<tr>
						<td><strong>{LANG.name}</strong></td>
						<td><input type="text" maxlength="255" value="{rowcontent.title}" id="idtitle" name="title" class="form-control"  style="width:350px"/><span class="text-middle"> {GLANG.length_characters}: <span id="titlelength" class="red">0</span>. {GLANG.title_suggest_max} </span></td>
					</tr>
					
					
					
					<tr>
						<td><strong>{LANG.Link}: </strong></td>
						<td><input class="form-control" name="link" id="link" type="text" value="{rowcontent.link}" maxlength="255"  style="width:350px"/></td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-striped table-bordered table-hover">
				<col class="w200" />
				<col />
				<tbody>
					<tr>
						<td><strong>{LANG.content_homeimg}</strong></td>
						<td><input class="form-control" style="width:380px" type="text" name="homeimg" id="homeimg" value="{rowcontent.homeimgfile}"/> <input type="button" value="Browse server" name="selectimg" class="btn btn-info" /></td>
					</tr>
				</tbody>
			</table>
			<table class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
						<td><strong>{LANG.content_hometext}</strong> {LANG.content_notehome}. {GLANG.length_characters}: <span id="descriptionlength" class="red">0</span>. {GLANG.description_suggest_max} </td>
					</tr>
					<tr>
						<td><textarea id="description" name="hometext" rows="5" cols="75" style="font-size:14px; width: 100%; height:100px;" class="form-control">{rowcontent.hometext}</textarea></td>
					
				
				
				</tbody>
			</table>
			
					<table class="table table-striped table-bordered table-hover">
				<tbody>
				
				<tr>
						<td><strong>{LANG.content_publ_date} </strong></td>
						<td><div class="message_body">
								<input class="form-control" name="publ_date" id="publ_date" value="{publ_date}" style="width: 80px;" maxlength="10" readonly="readonly" type="text"/>
								<select class="form-control" name="phour">
									{phour}
								</select>
								:
								<select class="form-control" name="pmin">
									{pmin}
								</select>
							</div></td>
					</tr>
				
				
					<tr>
						<td><strong>{LANG.content_exp_date}</strong></td>
						<td>
								<input class="form-control" name="exp_date" id="exp_date" value="{exp_date}" style="width: 80px;" maxlength="10" readonly="readonly" type="text"/>
								<select class="form-control" name="ehour">
									{ehour}
								</select>
								:
								<select class="form-control" name="emin">
									{emin}
								</select>
								<div style="margin-top: 5px;">
									<input type="checkbox" value="1" name="archive" {archive_checked} />
									<label> {LANG.content_archive} </label>
								</div>
							
							</td>
					</tr>
				
				
				
				

				
				
				</tbody>
			</table>
			
			
			
			
			
			
			
			
			
			
		
	</div>
	</div>
	<div class="text-center">
		<br/>
		<input type="hidden" value="1" name="save" />
		<input type="hidden" value="{rowcontent.id}" name="id" />
		<!-- BEGIN:status -->
		<input class="btn btn-primary" name="statussave" type="submit" value="{LANG.save}" />
		<!-- END:status -->
		<!-- BEGIN:status0 -->
		<input class="btn btn-primary" name="status4" type="submit" value="{LANG.save_temp}" />
		<input class="btn btn-primary" name="status1" type="submit" value="{LANG.publtime}" />
		<!-- END:status0 -->
        <!-- BEGIN:status1 -->
		<input class="btn btn-primary" name="status4" type="submit" value="{LANG.save_temp}" />
		<input class="btn btn-primary" name="status6" type="submit" value="{LANG.save_send_admin}" />
            <!-- BEGIN:status0 -->
            <input class="btn btn-primary" name="status0" type="submit" value="{LANG.save_send_spadmin}" />
            <!-- END:status0 -->
		<!-- END:status1 -->
		<br />
	</div>
</form>
<div id="message"></div>
<script type="text/javascript">
//<![CDATA[
var content_checkcatmsg = "{LANG.content_checkcatmsg}";
$("input[name=selectimg]").click(function() {
	var area = "homeimg";
	var alt = "homeimgalt";
	var path = "{UPLOADS_DIR_USER}";
	var currentpath = "{UPLOAD_CURRENT}";
	var type = "image";
	nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&alt=" + alt + "&path=" + path + "&type=" + type + "&currentpath=" + currentpath, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
	return false;
});
$('[type="submit"]').hover(function(){
	
	if( $('[name="alias"]').val() == '' ){
		if( $('#message-alias').length == 0 ){
			$('#message').append('<div id="message-alias" class="alert alert-danger">{LANG.alias_empty_notice}.</div>');
		}
	}else{
		$('#message-alias').remove();
	}
});
//]]>
</script>
<script type="text/javascript" src="{NV_BASE_SITEURL}js/ui/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}js/ui/jquery.ui.menu.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}js/ui/jquery.ui.autocomplete.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}js/ui/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}modules/news/js/content.js"></script>

<!-- END:main -->