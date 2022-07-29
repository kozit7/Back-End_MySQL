<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>
<style>
	
	#button{
		background-color : #B2CCFF;
		border : 1px solid #4374D9;
		color : white;
		width : 100px;
		height : 35px;
		}
	#title{
		width : 715px;
		}


</style>
<h1 align="center">글쓰기</h1>
<form method="post"> 
<table border="0" align="center">
	<tr>
		<td>제목</td>
		<td><input type ="text" name="title" id="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="100px" rows="30px" name="content"></textarea></td>
	</tr>

	<tr>
		<td colspan="2" align="center">
		<input type="submit" id="button" value="글쓰기" formaction="boardwriteServer2.jsp">
		<input type="submit" id="button" value="목록으로" formaction="boardlist2.jsp"></td>
	</tr>
	

</table>
</form>
</body>
</html>