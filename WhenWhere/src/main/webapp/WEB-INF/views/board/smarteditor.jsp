<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>스마트에디터</title>
<script type="text/javascript" src="../smartEditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>


</head>
<body>
			
	<textarea rows="10" cols="30" id="ir1" name="content" style="width: 100%; height: 412px;"></textarea>
	<script type="text/javascript">
		var oEditors = [];
		$(function() {
			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "ir1",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI : "../smartEditor/SmartEditor2Skin.html",
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,
							fOnBeforeUnload : function() {
							}
						},
						fOnAppLoad : function() {
							//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
							oEditors.getById["ir1"].exec("PASTE_HTML",
									[ "내용을 적어주세요" ]);
						},
						fCreator : "createSEditor2"
					});
		});
	
		
	</script>

</body>
</html>