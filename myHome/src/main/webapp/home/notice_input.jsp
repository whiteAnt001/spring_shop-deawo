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
<h3 align="center">�������� ����</h3>
<form action="../notice/input.html" method="post" onsubmit="return check()" name="frm">
<table border="1">
	<tr><th>�������� ����</th><td><input type="text" name="TITLE" size="30"/></td></tr>
	<tr><th>�������� ����</th><td><textarea rows="4" cols="50" name="CONTENT"></textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="�� �ø���"/>
						<input type="reset" value="�� ��"/></td></tr>
</table>
</form>
<script type="text/javascript">
function check(){
	if(document.frm.TITLE.value == ''){
		alert("������ �Է��ϼ���."); return false;
	}
	if(document.frm.CONTENT.value == ''){
		alert("������ �Է��ϼ���."); return false;
	}
	if( ! confirm("������ ����Ͻðڽ��ϱ�?")) return false;
}
</script>
</div>
</body>
</html>










