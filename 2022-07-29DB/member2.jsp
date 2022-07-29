<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<style>
	#button{
		background-color : #B2CCFF;
		border : 1px solid #4374D9;
		color : white;
		width : 160px;
		}
	table{
		width : 30%;
	}
	input{
		width : 400px;
		height : 35px;
		font-size:15px;
	}
	td{
	font-size:15px;}

	
</style>
<h1 align="center">회원가입</h1>
<form action ="memberServer2.jsp">
<table align="center">
	<tr>
		<td><input type ="text" name="id" placeholder="ID"></td>
	</tr>
	<tr>
		<td><input type ="password" name="pw" placeholder="PASSWORD"></td>
	</tr>
	<tr>
		<td><input type ="text" name="name" placeholder="NAME"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" id="button" value="회원가입">
		</td>
	</tr>
</table>
</form>
</body>
</html>