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
<h2>�Խñ� ����</h2>
	<table border="1">
	<tr><th>�۹�ȣ</th><th>������</th><th>�ۼ���</th><th>�ۼ���</th></tr>
	<c:forEach var="imagebbs" items="${ list }">
	<tr><td width="80">${ imagebbs[0].w_id }</td><td><a href="../imagebbs/detail.html?id=${ imagebbs[0].w_id }">${ imagebbs[0].title }</a></td>
		<td>${ imagebbs[1].user_id }</td><td>${ imagebbs[0].w_date }</td>
	</tr>
	</c:forEach>
	</table>
	<c:forEach begin="1" end="${ pageCount }" var="page">
		<a href="../mypage/myimage.html?id=${ id }&page=${ page }">${ page }</a>
	</c:forEach>
</div>
</body>
</html>