<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="../ckEditor/ckeditor.js"></script>   
<script type="text/javascript">
var no = '${vo.no}';
var url = '${vo.imageUrl}';
console.log("no"+no);
console.log("url"+url);
window.parent.CKEDITOR.tools.callFunction(no,'url','이미지를 업로드 하였습니다.');

</script>