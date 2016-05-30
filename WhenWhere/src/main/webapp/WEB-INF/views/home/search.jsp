<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test section</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="../css/styles.css" />

<link rel="stylesheet" href="../css/search.css">

</head>
<body>
	<jsp:include page="../component/topNav.jsp" />
	<section class="bg-primary" id="one">
		<div class="container">
			<div class="row center">
				<div class="hero-unit">
					<div class="input-daterange" id="datepicker">
						<input type="text" class="input-small" name="start" /> <span
							class="add-on" style="vertical-align: top; height: 27px">to</span>
						<input type="text" class="input-small" name="end" />
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="scrollDiv">scroll</div>
	<jsp:include page="../component/footer.jsp" />

	<!-- Load jQuery and bootstrap datepicker scripts -->
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
                
                $('.input-small').on('click', function() {
					
					if($('#scrollDiv').css('display') == 'none'){
						$('#scrollDiv').slideDown();
					}else{
						$('#scrollDiv').slideUp();
					}
				})
            
            });
        </script>
</body>
</html>