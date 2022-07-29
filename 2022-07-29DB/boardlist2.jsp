<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
<style>

	#button{
		background-color : #B2CCFF;
		border : 1px solid #4374D9;
		color : white;
		width : 100px;
		height : 35px;
		align : center;
		}
		
	table, td, th{
		border-collapse : collapse;
		text-align : center;
		
		}
	#write{
		border-color:black white white white;
		}

</style>
<h1 align="center">게시글 목록 리스트</h1>
<form>
<table border = "1" align="center" width="80%">

	<tr>
		<td width="10%">글번호</td><td width="20%">글쓴이</td><td width="80%">글제목</td>
	</tr>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();
	
	pstmt=conn.prepareStatement("select * from board2 b left join member2 m on b.id = m.id");

	rs=pstmt.executeQuery();
	
	while(rs.next()){ 
%>
	<tr>
	<td><%=rs.getString("bon") %></td>
	<td><%=rs.getString("name") %></td>
	<td><a href="boarddetail.jsp?bon=<%=rs.getString("bon") %>"><%=rs.getString("title") %></a></td>
	</tr>
	
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
<tr align="center">
<td colspan="4" id ="write">
<input type = "submit" id="button" value="글쓰기" formaction="boardwrite2.jsp"></td>
</tr>
</table>
</form>
</body>
</html>