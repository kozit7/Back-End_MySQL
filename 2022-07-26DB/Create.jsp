<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판 글쓰기</h1>
<form action ="CreateServer.jsp">
<table border = "0">
	<tr>
		<td><input type ="text" name = "writer" placeholder="닉네임"></td>
	</tr>
	<tr>
		<td><input type ="text" name = "title" placeholder="글 제목"></td>
	</tr>
	<tr>
	<td><textarea name="body" placeholder="내용을 입력해주세요"></textarea>	</td>
	</tr>
</table>
<input type="submit" value="글쓰기">
</form>
</body>
</html>