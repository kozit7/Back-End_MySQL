<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginServer.jsp"> <!-- 서버주소 -->
<table>
	<tr>
		<td>아이디</td>
		<td><input type ="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type ="password" name="pw"></td>
	</tr>
	<tr>
		<td><input type="submit" value ="로그인"></td>
	</tr>
</table>
</form>

</body>
</html>