<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form:form action="../image/updateDo.html" method="post" enctype="multipart/form-data"
	onsubmit="return check(this)" modelAttribute="imagebbs">
<form:hidden path="w_id"/>
<form:hidden path="password"/>
<form:hidden path="imagename"/>
<table>
	<tr><th>������</th><td><form:input path="title"/></td></tr>
	<tr><th>�ۼ���</th><td>${imagebbs.writer }</td></tr>
	<tr><th>�ۼ���</th><td>${imagebbs.w_date }</td></tr>
	<tr><th>�� ȣ</th><td><input type="password" name="PWD"/></td></tr>
	<tr><td colspan="2" align="center"><input type="file" name="image"/><br/>
		<img alt="" src="${pageContext.request.contextPath}/upload/${imagebbs.imagename }"
			 width="250" height="200"/></td></tr>
	<tr><th>�� ��</th><td><form:textarea path="content" rows="5" cols="60"/></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="����"/>
		<input type="reset" value="���"/></td></tr>
</table>
</form:form>
<script type="text/javascript">
function check(frm){
	if(frm.title.value == ''){	alert("������ �Է��ϼ���."); frm.title.focus(); return false;}
	if(frm.PWD.value == ''){
		alert("��ȣ�� �Է��ϼ���."); frm.PWD.focus(); return false;
	}else {
		if(frm.password.value != frm.PWD.value){//�Է��� ��ȣ�� DB�� ��ȣ�� ��ġ���� �ʴ� ���
			alert("��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���."); frm.PWD.focus(); return false;
		}
	}
	if(frm.content.value == ''){
		alert("������ �Է��ϼ���."); frm.content.focus(); return false;
	}
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</div>
</body>
</html>
















