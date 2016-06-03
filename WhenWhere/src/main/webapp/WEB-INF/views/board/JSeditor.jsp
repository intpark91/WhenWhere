<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>에디터</title>
 	
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../css/main/skin-blue.css">
  <link rel="stylesheet" href="../css/bootstrap3-wysihtml5.min.css">
  <style>
  	.content-wrapper1{
  		height: 550px;
  	}
  </style>		
</head>
<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper">
  <div class="content-wrapper1">
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-body pad">
              <form>
                    <textarea id="editor1" name="editor1" rows="10" cols="80">
                       		내용을 입력해주세요.
                       		
                    </textarea>
              </form>
             
            </div>
             <button type="button" id="btn">파일업로드</button>
          </div>		
      </div>
    </section>
    	
  </div>
</div>
<!-- jQuery 2.2.0 -->
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../js/bootstrap.min.js"></script>
<!-- FastClick -->
<!-- AdminLTE App -->
<script src="../js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../js/demo.js"></script>
<!-- CK Editor -->
<script src="../ckEditor/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->

<script>
	console.log('${pageContext.request.contextPath}');
 
    CKEDITOR.replace('editor1',{
    	filebrowserImageUploadUrl : '${pageContext.request.contextPath}/board/ckeditorImageUpload',
    	
    });  

</script>
    <script>
	$(function(){
		$('#btn').on('click',function(){	
			
			window.open('../smartEditor/photo_uploader/popup/fileupload.html','win2','scrollbars=yes width=380, height=350');
		});
	});
  </script>


</body>
</html>