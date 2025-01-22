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
<h2>모든 고객의 주문 목록</h2>
<table border="1">
<tr><th>계 정</th><th>주문번호</th><th>주문상세번호</th><th>상품번호</th><th>주문 수량</th>
	<th>주문시간</th><th>배송상태</th><th>상태수정</th></tr>
<c:forEach var="order" items="${allOrders}">
<tr><td>${order.user_id }</td><td>${order.sale_id }</td><td>${order.sale_detail_id}</td>
	<td>${order.item_id }</td><td>${order.quantity }</td><td>${order.sale_time }</td>
	<td>${order.delivery_state }</td><td>수정버튼</td></tr>
</c:forEach>	
</table><br/><br/>
</div>
</body>
</html>















