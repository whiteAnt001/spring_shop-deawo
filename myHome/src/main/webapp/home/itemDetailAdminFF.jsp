<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*, java.util.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>��ǰ �� ����</h3>
<form:form action="../item/modifyff.html" method="post" modelAttribute="item">
<form:hidden path="codeChecked" value="yes"/>
<form:hidden path="item_code"/>
<table>
	<tr><th>��ǰ��ȣ</th><td>${item.item_code}</td></tr>
	<tr><th>��ǰ�̸�</th><td><form:input path="item_title"/>
		<font color="red"><form:errors path="item_title"/></font></td></tr>
	<tr><th>��ǰ����</th><td><form:input path="price"/>��
		<font color="red"><form:errors path="price"/></font></td></tr>
	<tr><th>�� �� ��</th><td><form:select path="madein">
		<c:forEach var="nation" items="${NATIONS }">
			<c:choose>
				<c:when test="${nation.code == item.madein }">
					<form:option value="${nation.code }" selected="selected">${nation.name }</form:option>				
				</c:when>
				<c:otherwise>
					<form:option value="${nation.code }">${nation.name }</form:option>				
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</form:select></td></tr>
	<tr><th>�� �� ��</th><td><input type="date" value="${item.reg_date}"/></td></tr>
	<tr><th>��ǰ����</th><td><form:textarea path="item_spec" rows="5" cols="40"/>
			<font color="red"><form:errors path="item_spec"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="����" name="BTN"/>
		<input type="submit" value="����" name="BTN"/></td></tr>
</table>
</form:form>
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








