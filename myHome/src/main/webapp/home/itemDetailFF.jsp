<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.Item" %>    
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
<h3>��ǰ �� ����</h3>
<form:form modelAttribute="item">
<table>
	<tr><th>��ǰ��ȣ</th><td><form:input path="item_code" readonly="true"/></td></tr>
	<tr><th>��ǰ�̸�</th><td><form:input path="item_title" readonly="true"/></td></tr>
	<tr><th>��ǰ����</th><td><form:input path="price" readonly="true"/></td></tr>
	<tr><th>�� �� ��</th><td><form:input path="madein" readonly="true"/></td></tr>
	<tr><th>�� �� ��</th><td>${ item.reg_date }</td></tr>
	<tr><th>��ǰ����</th><td><form:textarea path="item_spec" rows="5" cols="40" readonly="readonly"></form:textarea>
		</td></tr>
</table>
</form:form>
</div>
</body>
</html>








