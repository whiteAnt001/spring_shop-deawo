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
<h3>�̹��� �Խñ� �� ����</h3>
<form:form action="../image/deleteDo.html" method="post" modelAttribute="imagebbs" 
		onsubmit="return check(this)">
<form:hidden path="w_id"/>
<form:hidden path="password"/>
<table>
	<tr><th>�� ��</th><td>
		<form:input path="title" readonly="true"/></td></tr>
	<tr><th>�ۼ���</th><td>
		<form:input path="writer" readonly="true"/></td></tr>
	<tr><th>�� ȣ</th><td>
		<input type="password" name="PWD"/></td></tr>
	<tr><th>�ۼ���</th><td>
		<form:input path="w_date" readonly="true"/></td></tr>
	<tr><td colspan="2" align="center">
		<img alt="" src="${pageContext.request.contextPath}/upload/${imagebbs.imagename}"
			width="250" height="200"/></td></tr>
	<tr><th>�� ��</th><td><form:textarea path="content" readonly="true"
			rows="5" cols="60"/></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="����"/>
		<input type="reset" value="�� ��"/></td></tr>
</table>
</form:form>
<script type="text/javascript">
function check(frm){
	if(frm.PWD.value == ''){alert("��ȣ�� �Է��ϼ���."); frm.PWD.focus(); return false;	}
	else {
		if(frm.password.value != frm.PWD.value){//�Է��� ��ȣ�� DB�� ��ȣ�� �ٸ� ���
			alert("�Է��� ��ȣ�� �Խñ��� ��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���.");
			frm.PWD.focus();
			return false;
		}
	}
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</div>
</body>
</html>










