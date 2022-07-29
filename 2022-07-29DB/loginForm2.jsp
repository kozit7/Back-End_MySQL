<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
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

	
</style>
<h1 align="center">게시판 이용하기</h1>
<form> <!-- 서버주소 -->
<table align="center">
	<tr>
		<td><input type ="text" name="id" placeholder="ID" cols="2000px"></td>
	</tr>
	<tr>
		<td><input type ="password" name="pw" placeholder="PASSWORD" ></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" id= "button" value ="로그인" formaction="loginServer2.jsp">
			
			<input type="submit" id= "button" style="float:right" value ="회원가입" formaction="member2.jsp">
			

		</td>
	</tr>
	
</table>
</form>

</body>
</html>