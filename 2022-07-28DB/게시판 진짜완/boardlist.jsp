<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트()화면이 곧 서버)</title>
</head>
<body>
<table border="1">
	<tr>
		<td>No.</td><td>제목</td><td>작성일자</td><td>조회수</td>
	</tr>
<%


Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();
	
	pstmt=conn.prepareStatement("select * from board");

	rs=pstmt.executeQuery();

	//	while(rs.next()){ 
%>

<tr>
<td><%=rs.getString("bon") %></td>
<td><a href="boarddetail.jsp?bon=<%=rs.getString("bon") %>"><%=rs.getString("title") %></a></td>
<td><%=rs.getString("regdate") %></td>
<td><%=rs.getString("cnt") %></td>
</tr>

<%
	//}
	
}catch(Exception e){

	e.printStackTrace();
}finally{
	conn.close();
	rs.close();
	pstmt.close();
}
%>
<tr><td colspan="2" align="right">
<a href = "boardwrite.jsp" type ="button">글 쓰기</a><a href="logoutServer.jsp">로그아웃</a>
</td></tr>
</table>

</body>
</html>