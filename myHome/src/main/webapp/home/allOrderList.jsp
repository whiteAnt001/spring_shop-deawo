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
<h2>��� ���� �ֹ� ���</h2>
<table border="1">
<tr><th>�� ��</th><th>�ֹ���ȣ</th><th>�ֹ��󼼹�ȣ</th><th>��ǰ��ȣ</th><th>�ֹ� ����</th>
	<th>�ֹ��ð�</th><th>��ۻ���</th><th>���¼���</th></tr>
<c:forEach var="order" items="${allOrders}">
<tr><td>${order.user_id }</td><td>${order.sale_id }</td><td>${order.sale_detail_id}</td>
	<td>${order.item_id }</td><td>${order.quantity }</td><td>${order.sale_time }</td>
	<td>${order.delivery_state }</td><td>������ư</td></tr>
</c:forEach>	
</table><br/><br/>
</div>
</body>
</html>















