<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.num {width: 35px;}
</style>
</head>
<body>
<div align="center">
<h3>��ٱ��� ���</h3>
<c:set var="cartList" value="${ requestScope.CARTLIST }"/>
<c:choose>
	<c:when test="${ cartList == null }">
		<h3>��ٱ��ϰ� ����ֽ��ϴ�.</h3>
	</c:when>
	<c:otherwise>
		<table>
	<tr><th>��ǰ�ڵ�</th><th>��ǰ�̸�</th><th>�� ��</th><th>��ǰ����</th><th>�� ��</th>
		<th>����/����</th></tr>
	<c:forEach var="item" items="${ CARTLIST }">
	<form action="../cart/modify.html" method="post" onsubmit="return check()">
	<input type="hidden" name="CODE" value="${ item.item_code }"/>
	<tr><td>${ item.item_code }</td><td>${ item.item_title }</td>
		<td><fmt:formatNumber value="${ item.price }" groupingUsed="true"/>��</td><td><input type="number" name="NUM" min="0" value="${ item.num }" class="num"/></td>
		<td><fmt:formatNumber value="${ item.sum }" groupingUsed="true"/>��</td><td><input type="submit" value="����" name="BTN"/>
			<input type="submit" value="����" name="BTN"/></td></tr>
	</form>
	</c:forEach>
	</table>
	<script>
	function check(){
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
	}
	</script>
<form action="../checkout/checkout.html">
	�� �� : <fmt:formatNumber value="${ TOTAL }" groupingUsed="true"/>�� <input type="submit" value="�����ϱ�"/>
</form>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>









