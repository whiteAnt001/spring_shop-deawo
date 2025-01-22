<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*, java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="dto" value="${ITEM }"/>
<div align="center">
<h3>��ǰ �� ����</h3>
<form action="../item/modify.html" method="post" onsubmit="return check(this)">
<input type="hidden" name="CODE" value="${dto.item_code}">
<table>
	<tr><th>��ǰ��ȣ</th><td>${dto.item_code}</td></tr>
	<tr><th>��ǰ�̸�</th><td><input type="text" name="NAME" value="${dto.item_title}"></td></tr>
	<tr><th>��ǰ����</th><td><input type="text" name="PRICE"
			value="${dto.price}"/>��</td></tr>
	<tr><th>�� �� ��</th><td><select name="NATION">
		<c:forEach var="nation" items="${NATIONS }">
			<c:choose>
				<c:when test="${nation.code == dto.madein }">
					<option value="${nation.code }" selected="selected">${nation.name }</option>				
				</c:when>
				<c:otherwise>
					<option value="${nation.code }" >${nation.name }</option>				
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</select></td></tr>
	<tr><th>�� �� ��</th><td>${dto.reg_date}</td></tr>
	<tr><th>��ǰ����</th><td><textarea rows="5" cols="40" 
		name="SPEC">${dto.item_spec}</textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="����" name="BTN"/>
		<input type="submit" value="����" name="BTN"/></td></tr>
</table>
</form>
<script type="text/javascript">
function check(frm){
	if(frm.NAME.value==''){	alert("��ǰ�̸��� �Է��ϼ���."); frm.NAME.focus(); return false;	}
	if(frm.SPEC.value==''){ alert("��ǰ������ �Է��ϼ���."); frm.SPEC.focus(); return false; }
	if(frm.PRICE.value==''){alert("������ �Է��ϼ���."); frm.PRICE.focus(); return false; }
	if( ! confirm("������ �۾��� �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</div>
</body>
</html>








