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
<h1>상세 내용 화면</h1>
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
	
	pstmt=conn.prepareStatement("select * from board where bon=?");
	pstmt.setInt(1, bon);
	rs=pstmt.executeQuery();

		if(rs.next()){ 
%>

<table border ="1">
	<tr>
		<td>제목</td><td><%=rs.getString("title") %></td>
	</tr>
	<tr>
		<td>내용</td><td><%=rs.getString("content") %></td>
	</tr>
	<tr>
		<td colspan="2"><a href="boardmodify.jsp?bon=<%=rs.getInt("bon") %>">수정화면 이동</a></td>
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