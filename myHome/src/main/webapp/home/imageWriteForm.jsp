<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">이미지 게시글 작성</h3>
<form:form action="../image/write.html" method="post" enctype="multipart/form-data" modelAttribute="bbsimage">
<form:hidden path="order_no" value="${ bbsimage.order_no + 1 }"/>
<c:if test="${ ! empty bbsimage.group_id }">
<form:hidden path="group_id" value="${ bbsimage.group_id }"/>
</c:if>
<c:if test="${ ! empty bbsimage.parent_id }">
<form:hidden path="parent_id" value="${ bbsimage.parent_id }"/>
</c:if>
<table>
	<tr><th>제 목</th><td><form:input path="title" value="${ title }"/>
		<font color="red"><form:errors path="title"/></font></td></tr>
	<tr><th>암 호</th><td><form:password path="password"/>
		<font color="red"><form:errors path="password"/></font></td></tr>
	<tr><th>이미지</th><td><input type="file" name="image"/>
		<font color="red"><form:errors path="image"/></font></td></tr>
	<tr><th>내 용</th><td><form:textarea path="content" rows="8" cols="60"></form:textarea>
		<font color="red"><form:errors path="content"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="글 올리기"/>
		<input type="reset" value="취 소"/></td></tr>
</table>
</form:form>
<script type="text/javascript">
function check(frm){
	if(frm.TITLE.value == ''){	alert("제목을 입력하세요."); frm.TITLE.focus(); return false;}
	else {
		if(frm.TITLE.value.length > 20){
			alert("제목은 20자 이내로 입력하세요."); frm.TITLE.focus(); return false;
		}
	}
	if(frm.PWD.value == ''){alert("암호를 입력하세요."); frm.PWD.focus(); return false;}
	else {
		if(frm.PWD.value.length > 15){
			alert("암호는 15자 이내로 입력하세요."); frm.PWD.focus(); return false;
		}
	}
	if(frm.IMAGENAME.value == ''){
		alert("이미지 파일을 선택하세요."); frm.IMAGENAME.focus(); return false;
	}
	if(frm.CONTENT.value == ''){alert("내용을 입력하세요."); frm.CONTENT.focus(); return false;}
	else {
		if(frm.CONTENT.value.length > 50){
			alert("내용은 50자 이내로 입력하세요."); frm.CONTENT.focus(); return false;
		}
	}
	if( ! confirm("정말로 글을 올리시겠습니까?")) return false;
}
</script>
</body>
</html>
















