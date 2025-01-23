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
<h2>ȸ�� ��ȸ ���</h2>
<table border="1">
<tr><th>����</th><th>�̸�</th><th>�ּ�</th><th>��ȭ��ȣ</th><th>�̸���</th><th>����</th>
	<th>���</th><th>����</th></tr>
<c:forEach var="member" items="${memberList}">
<tr><td><a href="../admin/getMember.html?id=${ member.user_id }">${member.user_id }</a></td><td>${member.name }</td><td>${member.addr }</td>
	<td>${member.phone }</td><td>${member.email }</td><td>
		<c:if test="${member.gender == 'M' }">����</c:if>
		<c:if test="${member.gender == 'F'  }">����</c:if></td>
	<td>${member.grade }</td><td>${member.job }</td></tr>
</c:forEach>	
</table><br/>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="#" onclick="movePage(${page})">${page }</a>
</c:forEach>
<form method="post" name="frm">
<input type="hidden" name="ID" value="${ID }"/>
<input type="hidden" name="NAME" value="${NAME }"/>
<input type="hidden" name="ADDR" value="${ADDR }"/>
<input type="hidden" name="EMAIL" value="${EMAIL }"/>
<input type="hidden" name="PAGE"/>
</form>
<script type="text/javascript">
function movePage(num){
	document.frm.action = "../admin/findmember.html";
	document.frm.PAGE.value=num;
	document.frm.submit();
}
</script>
</div>
</body>
</html>