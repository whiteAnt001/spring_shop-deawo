<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.Item" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="dto" value="${ITEM }"/>
<div align="center">
<h3>��ǰ �� ����</h3>
<table>
	<tr><th>��ǰ��ȣ</th><td>${dto.item_code}</td></tr>
	<tr><th>��ǰ�̸�</th><td>${dto.item_title}</td></tr>
	<tr><th>��ǰ����</th><td>${dto.price}��</td></tr>
	<tr><th>�� �� ��</th><td>${dto.madein}</td></tr>
	<tr><th>�� �� ��</th><td>${dto.reg_date}</td></tr>
	<tr><th>��ǰ����</th><td><textarea rows="5" cols="40" readonly="readonly">${dto.item_spec}</textarea>
		</td></tr>
</table>
</div>
</body>
</html>








