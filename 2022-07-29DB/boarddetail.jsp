<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지(화면이 곧 서버)</title>
</head>
<body>
<style>
	table, td, th{
		border-collapse : collapse;
		
		}
	button{
		background-color : #B2CCFF;
		border : 1px solid #4374D9;
		color : white;
		width : 100px;
		height : 35px;
		}
	#title{
		width : 715px;
		}
	#contetn{
		input-width : 500px;
		height : 500px;}
	input{
		width : 400px;}

</style>
<h1 align="center">상세 내용 화면</h1>
	<%
	// 데이터 수집(bon 값)
	int bon = Integer.parseInt(request.getParameter("bon"));
	
//DB연결
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();
	
	pstmt=conn.prepareStatement("select * from board2 where bon=?");
	pstmt.setInt(1, bon);
	rs=pstmt.executeQuery();

		if(rs.next()){ 
%>

<table border ="0" align="center" width="61%">
	<tr>
		<td align="center">제목</td><td><input type ="text" name="title" value="<%=rs.getString("title") %>" readonly></td>
	</tr>
	<tr>
		<td align="center">작성자</td><td><input type ="text" name="id" value="<%=rs.getString("id") %>" readonly></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td style="width:82.9%;height:150px;"><textarea name="content" style="width:85%; height:300px" readonly  ><%=rs.getString("content") %> </textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><button type = "button" onclick=location.href="boardmodify.jsp?bon=<%=rs.getInt("bon") %>">수정</button></td>
	</tr>
	
</table>
<%
		}
	
}catch(Exception e){

	e.printStackTrace();
}finally{
	conn.close();
	rs.close();
	pstmt.close();
}

%>
</body>
</html>