<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="dto" value="${ DETAIL }"/>
<div align="center">
<h3>�̹��� �Խñ� �󼼺���</h3>
<table>
	<tr><th>�� ��</th><td>${ dto.title }</td></tr>
	<tr><th>�ۼ���</th><td>${ dto.writer }</td></tr>
	<tr><th>�ۼ���</th><td>${ dto.w_date }</td></tr>
	<tr><td colspan="2" align="center"><img alt="" src="${ pageContext.request.contextPath }/upload/${ dto.imagename }"
			width="250" height="200"/></td></tr>
	<tr><th>�� ��</th><td><textarea rows="5" cols="60" 
			readonly="readonly">${ dto.content }</textarea></td></tr>
	<tr><td colspan="2" align="center">
		<a href="javascript:goReply()">[���]</a>
		<a href="javascript:goModify()">[����]</a>
		<a href="javascript:goDelete()">[����]</a>
		<a href="../image/imageList.html">[���]</a></td></tr>
</table>
</div>
<form name="frm" method="post">
	<input type="hidden" name="id" value="${ dto.w_id }"/>
	<input type="hidden" name="parentid" value="${ dto.parent_id }"/>
	<input type="hidden" name="groupid" value="${ dto.group_id }"/>
</form>
<script type="text/javascript">
function goReply(){
	document.frm.action = "../image/imageReplyForm.html";
	document.frm.submit();
}
function goModify(){
	document.frm.action = "../image/modify.html";
	document.frm.submit();//���� ȣ��
}
function goDelete(){
	document.frm.action = "../image/delete.html";
	document.frm.submit();//���� ȣ��
}
</script>
</body>
</html>









