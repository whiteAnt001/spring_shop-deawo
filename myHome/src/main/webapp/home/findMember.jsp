<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
table.member {width:50%;}
</style>
</head>
<body>
<div align="center">
<h2>������ ��ȸ</h2>
<form action="../admin/findmember.html" method="post">
<h3>�˻��� �׸��� �Է��ϰ� ��ȸ��ư�� ��������.</h3>
<table border="1" class="member">
	<tr><th>�� ��</th><td><input type="text" name="ID"/></td></tr>
	<tr><th>�� ��</th><td><input type="text" name="NAME"/></td></tr>
	<tr><th>�� ��</th><td><input type="text" name="ADDR"/></td></tr>
	<tr><th>�̸���</th><td><input type="text" name="EMAIL"/></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="�� ȸ"/>
		<input type="reset" value="�� ��"/></td></tr>
</table>
</form>
</div>
</body>
</html>













