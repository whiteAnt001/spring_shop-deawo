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
<c:choose>
	<c:when test="${ param.R == 'NO' }">
		<script type="text/javascript">
			setTimeout(function(){
				alert("답글이 존재하여 게시글 삭제가 불가능합니다.");
			location.href="../image/imageList.html"
			},100);
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			setTimeout(function(){
				alert("게시글이 삭제되었습니다.");
			location.href="../image/imageList.html"
			},100);
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>
















