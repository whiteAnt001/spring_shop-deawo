<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>��ǰ ������ ���</h3>
<form action="" name="madeinfrm" onsubmit="return check(this)">
<table>
	<tr><th>�����ڵ�</th><td><input type="text" name="CODE"/>
		<input type="button" value="�ߺ� �˻�" onclick="codeCheck1()"/></td></tr>
	<tr><th>�����̸�</th><td><input type="text" name="NAME"/></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="������ ���"/>
		<input type="reset" value="�� ��"/></td></tr>
</table>
</form>
<script type="text/javascript">
function codeCheck1(){
	alert("codeCheck1");
}
</script>
</div>
</body>
</html>















