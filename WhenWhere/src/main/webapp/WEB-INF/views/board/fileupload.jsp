<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap-imgupload.min.css">
	
 </head>
 <body>
   <div class="container">
           <form id="editor_upimage" name="editor_upimage" action="FileUploader.php" method="post" enctype="multipart/form-data" onSubmit="return false;">
                <div class="form-group">
                    <div class="imgupload panel panel-default">
                        <div class="panel-heading clearfix">
                            <h3 class="panel-title pull-left">Upload image</h3>
                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default">File</button>
                            </div>
                        </div>
                        <div class="file-tab panel-body">
                            <div>
                                <button type="button" class="btn btn-default btn-file">
                                    <span>Browse</span>
                                    <input type="file" id="uploadInputBox" name="file-input">
                                </button>
                                
								<button type="submit" id="uploadbtn" class="btn btn-default">전송</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../../js/bootstrap.min.js"></script>
<!-- FastClick -->
<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- CK Editor -->

<!-- Bootstrap WYSIHTML5 -->

<script type="text/javascript" src="../js/bootstrap-imgupload.min.js"></script>
		 <script type="text/javascript">
            $('.imgupload').imgupload();
</script>

<script type="text/javascript" src="jindo.min.js" charset="utf-8"></script>
<script type="text/javascript" src="jindo.fileuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="attach_photo.js" charset="utf-8"></script>

 </body>
</html>