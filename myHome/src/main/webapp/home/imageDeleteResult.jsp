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
<c:choose>
	<c:when test="${param.R == 'NO' }">
		<script type="text/javascript">
			setTimeout(function(){
				alert("����� �����ϹǷ� �Խñ��� �������� �ʾҽ��ϴ�.");
				location.href="../image/imageList.html";
			},100);
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			setTimeout(function(){
				alert("�Խñ��� �����Ǿ����ϴ�.");
				location.href="../image/imageList.html";
			},100);
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>
















