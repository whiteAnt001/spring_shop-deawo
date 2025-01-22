<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<h3 align="center">��ǰ ���</h3>
<div align="center">
<script type="text/javascript">
function codeCheck(){
	if(document.itemFrm.item_code.value == ''){
		alert("��ǰ�ڵ带 �Է��ϼ���."); return;
	}
	var url="../item/codecheck.html?CODE="+document.itemFrm.item_code.value;
	window.open(url, "__blank__","width=450,height=200,top=200,left=300");
}
</script>
<form:form action="../item/register.html" method="post" modelAttribute="item" name="itemFrm">
<form:hidden path="codeChecked"/>
	<table border="1">
	<tr><th>��ǰ�ڵ�</th><td><form:input path="item_code"/>
			<font color="red" size="2"><form:errors path="codeChecked"/></font>
			<input type="button" value="�ڵ� �ߺ� �˻�" onclick="codeCheck()"/></td></tr>
	<tr><th>��ǰ�̸�</th><td><form:input path="item_title"/>
			<font color="red"><form:errors path="item_title"/></font></td></tr>
	<tr><th>��ǰ����</th><td><form:input path="price"/>
			<font color="red"><form:errors path="price"/></font></td></tr>
	<tr><th>������</th><td><form:select path="madein">
		<c:forEach var="nation" items="${NATIONS }">
			<form:option value="${nation.code }">${nation.name }</form:option>
		</c:forEach></form:select></td></tr>
	<tr><th>��ǰ����</th><td><form:textarea path="item_spec" rows="5" cols="40"/>
			<font color="red"><form:errors path="item_spec"/></font></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="��ǰ ���"/>
		<input type="reset" value="�� ��"/></td></tr>
	</table>
</form:form>
</div>
</body>
</html>













