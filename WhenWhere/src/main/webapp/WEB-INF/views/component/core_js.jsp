<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="../js/bootbox.min.js"></script>
<script src="../js/app.js"></script>
<script src="../js/jquery.bootstrap-growl.min.js"></script>
<script src="../js/detect-device.js"></script>
<script type="text/javascript">
	$(function() {
		$("ul.sidebar-menu li").each(function() {
			$(this).toggleClass("active");
		})
		$("ul.sidebar-menu li:eq(${path})").toggleClass("active");
	});
</script>
