<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<c:choose>
	<c:when test="${ FAIL == 'YES' }">
		<h3>�α��ε��� �ʾҽ��ϴ�. ������ ��ȣ�� Ȯ���ϼ���.</h3>
	</c:when>
	<c:otherwise>
		<h3>ȯ���մϴ�~${ sessionScope.loginUser.id }��~</h3>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>

