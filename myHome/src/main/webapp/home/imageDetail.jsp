<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>이미지 게시글 상세보기</h3>
<table>
	<tr><th>제 목</th><td>${IMAGE.title }</td></tr>
	<tr><th>작성자</th><td>${IMAGE.writer }</td></tr>
	<tr><th>작성일</th><td>${IMAGE.w_date }</td></tr>
	<tr><td colspan="2" align="center">
		<img alt="" src="${pageContext.request.contextPath}/upload/${IMAGE.imagename }"
			width="250" height="200"/></td></tr>
	<tr><th>내 용</th><td><textarea rows="5" cols="60" 
			readonly="readonly">${IMAGE.content }</textarea></td></tr>
	<tr><td colspan="2" align="center"><a href="../image/imageList.html">[목록]</a></td></tr></table>
</div>
</body>
</html>






