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
<div align="center">
<h2>�� ���� ����</h2>
<form:form action="../mypage/modify.html" method="post" modelAttribute="user_info">
<form:hidden path="gender"/>
<form:hidden path="birth"/>
<table>
	<tr><th>�� ��</th><td><form:input path="user_id" readonly="true"/></td></tr>
	<tr><th>�� ȣ</th><td><form:password path="user_pwd" value="${user_info.user_pwd }"/>
		<font color="red"><form:errors path="user_pwd"/></font></td></tr>
	<tr><th>�� ��</th><td><form:input path="name" readonly="true"/></td></tr>
	<tr><th>�� ��</th><td><form:input path="addr"/>
		<font color="red"><form:errors path="addr"/></font></td></tr>
	<tr><th>��ȭ��ȣ</th><td><form:input path="phone"/>
		<font color="red"><form:errors path="phone"/></font></td></tr>
	<tr><th>�� ��</th><td><c:if test="${user_info.gender == 'M' }">����</c:if>
		<c:if test="${user_info.gender == 'F' }">����</c:if></td></tr>
	<tr><th>�� ��</th><td><form:input path="grade" readonly="true"/></td></tr>
	<tr><th>�̸���</th><td><form:input path="email"/>
		<font color="red"><form:errors path="email"/></font></td></tr>
	<tr><th>�� ��</th><td><input type="date" value="${user_info.birth }"
								readonly="readonly"/></td></tr>
	<tr><th>�� ��</th><td><form:select path="job">
			<c:choose>
				<c:when test="${user_info.job == '�� ��' }">
					<form:option value="�� ��" selected="selected">�� ��</form:option>
				</c:when>
				<c:otherwise>
					<form:option value="�� ��">�� ��</form:option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${user_info.job == 'ȸ���' }">
					<form:option value="ȸ���" selected="selected">ȸ���</form:option>
				</c:when>
				<c:otherwise>
					<form:option value="ȸ���">ȸ���</form:option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${user_info.job == '�� ��' }">
					<form:option value="�� ��" selected="selected">�� ��</form:option>
				</c:when>
				<c:otherwise>
					<form:option value="�� ��">�� ��</form:option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${user_info.job == '�ڿ���' }">
					<form:option value="�ڿ���" selected="selected">�ڿ���</form:option>
				</c:when>
				<c:otherwise>
					<form:option value="�ڿ���">�ڿ���</form:option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${user_info.job == '�� Ÿ' }">
					<form:option value="�� Ÿ" selected="selected">�� Ÿ</form:option>
				</c:when>
				<c:otherwise>
					<form:option value="�� Ÿ">�� Ÿ</form:option>
				</c:otherwise>
			</c:choose>
		</form:select></td></tr>
	<tr><td align="center" colspan="2"><input type="submit" value="�������� ����"/>
			<input type="reset" value="�� ��"/></td></tr>
</table>
</form:form><br/><br/>
</div>
</body>
</html>














