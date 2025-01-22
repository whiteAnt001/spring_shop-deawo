<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h2>���� ����</h2>
	<c:if test="${ sales == null }">
		<h3>���� ������ �������� �ʽ��ϴ�.</h3>
	</c:if>
	<c:if test="${ sales != null }">
		<table border="1">
			<tr><th width="30">���Ź�ȣ</th><th width="200">������</th><th width="50">��ǰ��ȣ</th><th width="80">���ż���</th><th width="80">��ۻ���</th></tr>
			<c:forEach var="sale" items="${ sales }">
				<tr><td>${ sale[0].sale_id }</td><td>${ sale[0].sale_time }</td><td><a href="../mypage/itemdetail.html?id=${ sale[1].item_id }">${ sale[1].item_id }</a></td>
				<td>${ sale[1].quantity }��</td>
				<td><c:choose>
					<c:when test="${ sale[1].delivery_state == 0 }">
						�ֹ��Ϸ�
					</c:when>
					<c:when test="${ sale[1].delivery_state == 1 }">
						�����
					</c:when>
					<c:when test="${ sale[1].delivery_state == 2 }">
						��ۿϷ�
					</c:when>
				</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
</body>
</html>