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
<h3 align="center">��ǰ �ڵ� �ߺ� �˻� ���</h3>
<form action="../item/codecheck.html" name="frm">
	��ǰ �ڵ� : <input type="text" name="CODE" value="${CODE }"/>
	<input type="submit" value="�ߺ� �˻�"/>
</form><br/>
<c:choose>
	<c:when test="${DUP == 'NO' }">
	${CODE }�� ��� �����մϴ�. <input type="button" value="���" onclick="codeOk()">
	</c:when>
	<c:otherwise>
	${CODE }�� �̹� ��� ���Դϴ�.
	</c:otherwise>
</c:choose>
<script type="text/javascript">
function codeOk(){
	//�˾�â ��(codeCheckResult.jsp)�� �Էµ� ��ǰ�ڵ带 ��ǰ�����(inputItems.jsp)�� �̵���Ų��.
	//��, �ڽ�JSP���� �θ�JSP�� ������ ����
	opener.document.itemFrm.item_code.value = document.frm.CODE.value;
	opener.document.itemFrm.item_code.readOnly = true;
	opener.document.itemFrm.codeChecked.value = "YES";//�ߺ��˻�� �Ķ���Ϳ� ���� �ִ´�.
	self.close();//�˾�â�� �ݴ´�.
}
</script>
</body>
</html>













