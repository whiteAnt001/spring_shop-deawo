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
<h2 align="center">���� �ߺ� Ȯ��</h2>
<form action="../entry/idcheck.html">
�� �� : <input type="text" name="USER_ID" value="${ID }"/>
	<input type="submit" value="�ߺ��˻�"/>
</form>
<c:choose>
	<c:when test="${DUP == 'NO' }">
		${ID }�� ��� �����մϴ�. <input type="button" value="���" onclick="idOk('${ID}')"/>
	</c:when>
	<c:otherwise>
		${ID }�� ��� ���Դϴ�.
		<script type="text/javascript">
			opener.document.frm.ID.value = "";
		</script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
function idOk(userId){
	opener.document.frm.user_id.value = userId;
	opener.document.frm.user_id.readOnly = true;//������ �ȵǰ� �Ӽ��� readOnly�� �ٲ۴�.
	opener.document.frm.idChecked.value = "yes";//ID�ߺ��˻�� �Ķ����(idChecked)�� ���� �ִ´�.
	self.close();
}
</script>
</body>
</html>















