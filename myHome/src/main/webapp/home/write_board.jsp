<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script type="text/javascript">
function check(frm){
	if(frm.seq.value == ''){	alert('�۹�ȣ�� �Է��ϼ���.'); return false;	}
	else {
		if(isNaN(frm.seq.value)){ alert("�۹�ȣ�� ���ڷ� �Է��ϼ���."); return false; }
	}
	if(frm.id.value == ''){ alert("�ۼ��ڸ� �Է��ϼ���."); return false; }
	if(frm.title.value == ''){ alert("������ �Է��ϼ���."); return false; }
	if(frm.content.value == ''){ alert("������ �Է��ϼ���."); return false; }
	if( ! confirm("������ ����Ͻðڽ��ϱ�?")) return false;
}
</script>
<div align="center">
<h3 align="center">�Խñ� ����</h3>
<form:form action="../write/entryBoard.html" method="post" 
modelAttribute="board">
<p>�����Ӱ� ���� �ۼ��Ͻ� �� �ۿø��� ��ư�� ������, �ۼ��� ���� �Խñۿ� �ö󰩴ϴ�.</p>
<table border="1">
	<tr><th>������</th>
		<td><form:input path="title" placeHolder="������ �Է��ϼ���." size="30"/>
			<font color="red"><form:errors path="title"/></font></td></tr>
	<tr><th>�۳���</th>
		<td><form:textarea path="content" rows="5" cols="50"/>
			<font color="red"><form:errors path="content"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="�� �ø���"/>
						<input type="reset" value="�� ��"/></td></tr>
</table>
</form:form>
</div>
</body>
</html>










