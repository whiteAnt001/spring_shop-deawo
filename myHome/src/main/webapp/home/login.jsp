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
<div align="right"><a href="../entry/userEntry.html">�����ϱ�</a></div>
<div align="center" >
<form:form action="../login/loginDo.html" method="post" modelAttribute="loginUser">
	���� : <form:input path="id" size="12"/>
		<font color="red"><form:errors path="id"/></font><br/>
	��ȣ : <form:password path="password" size="12"/>
		<font color="red"><form:errors path="password"/></font><br/><br/>
	<input type="submit" value="�α���"/>
	<input type="reset" value="�� ��"/>
</form:form>
</div>
<script type="text/javascript">
function check(fm){
	if(fm.ID.value == ''){alert("������ �Է��ϼ���."); fm.ID.focus(); return false;}
	if(fm.PWD.value == ''){alert("��ȣ�� �Է��ϼ���."); fm.PWD.focus(); return false;}
}
</script>
</body>
</html>








