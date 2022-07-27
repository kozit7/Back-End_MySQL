<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="boardwriteServer.jsp"> 
<table border="1">
	<tr>
		<td>제목</td>
		<td><input type ="text" name="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="20px" rows="10px" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="글쓰기" ></td>
	</tr>
	
</table>
</form>
</body>
</html>