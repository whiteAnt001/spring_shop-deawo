<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>ȸ �� �� ��</h2>
<form action="../admin/memberUpdate.html" method="post" onabort="return check(this)">
<input type="hidden" name="ID" value="${ user.user_id }"/>
<table border="1">
	<tr><th>�� ��</th><td>${ user.user_id }</td></tr>
	<tr><th>�� ��</th><td>${ user.name }</td></tr>
	<tr><th>�� ȣ</th><td><input type="password" name="PWD" value="${ user.user_pwd }"/></td></tr>
	<tr><th>�� ��</th><td><input type="text" name="ADDR" value="${ user.addr }"/></td></tr>
	<tr><th>���Ϲ�ȣ</th><td><input type="text" name="PHONE" value="${ user.phone }"/></td></tr>
	<tr><th>�� �� </th><td>
		<c:if test="${ user.gender == 'M' }">��</c:if>
		<c:if test="${ user.gender == 'F' }">��</c:if></td></tr>
	<tr><th>�� ��</th><td><input type="text" name="GRADE" value="${ user.grade }"/></td></tr>
	<tr><th>�̸���</th><td>${ user.email }</td></tr>
	<tr><th>�� ��</th><td>${ user.birth }</td></tr>
	<tr><th>����</th><td>${ user.job }</td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="���� ����"/><input type="reset" value="�� ��">
</table></form><br/><br/>
</div>
<script type="text/javascript">
	function check(frm){
		if(frm.PWD.value ==''){
			alert("��ȣ�� �Է��ϼ���");
			frm.PWD.focus(); return false;
		}
		if(frm.ADDR.value == ''){
			alert("�ּҸ� �Է��ϼ���.");
			frm.ADDR.focus(); return false;
		}
		if(frm.GRADE.value== ''){
			alert("����� �Է��ϼ���.");
			frm.GRADE.focus(); return false;
		}else{
			if(isNAN(frm.GRADE.value)){
				alert("����� ���ڷ� �Է��ϼ���.");
				frm.GRADE.focus(); return false;
			}else {
				var grade = parseInt(frm.GRADE.value);
				if(grade > 2 || grade < 0){
					alert("����� 0�� 2���̷� �Է��ϼ���.");
					frm.GRADE.focus(); return false;
				}
			}
		}
		if(!confirm("������ �����Ͻðڽ��ϱ�?"))
			return false;
	}
	
</script>
</body>
</html>