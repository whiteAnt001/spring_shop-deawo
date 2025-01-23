<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
 alert("고객정보가 변경되었습니다.");
 location.href = "../admin/getMember.html?id=${user_id}";
</script>
</body>
</html>