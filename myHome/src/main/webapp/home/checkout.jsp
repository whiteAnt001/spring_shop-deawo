<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center" class="body">
<h2>����ȭ��</h2>
<font color="red"><b>��� ���� ��</b></font>
<table border="1">
	<tr><th>�����ID</th><td>${ loginUser.user_id }</td></tr>
	<tr><th>�� ��</th><td>${ loginUser.name }</td></tr>
	<tr><th>�� ��</th><td>${ loginUser.addr }</td></tr>
	<tr><th>�̸���</th><td>${ loginUser.email }</td></tr>
</table><br/><br/>
<font color="red"><b>���� ���</b></font>
<table border="1">
	<tr><th width="200">��ǰ��</th><th width="150">�� ��</th><th width="50">�� ��</th><th width="150">�� ��</th></tr>
	<c:forEach var="itemSet" items="${ itemList }">
	<tr><td align="left">${ itemSet.item.item_title }</td>
	<td align="right"><fmt:formatNumber value="${ itemSet.item.price }" groupingUsed="true"/>��</td>
	<td align="right">${ itemSet.quantity }</td>
	<td align="right"><fmt:formatNumber value="${ itemSet.quantity * itemSet.item.price }" groupingUsed="true"/>��</td></tr>
	</c:forEach>
</table><br/><br/><b>�� �� �� �� :<fmt:formatNumber value="${ totalAmount }" groupingUsed="true"/>��</b><br/><br/>
<form action="../end/end.html">
	<input type="submit" value="���� Ȯ��" name="btn"/>
</form>
</div>
</body>
</html>