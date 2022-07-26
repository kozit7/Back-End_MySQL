<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="CreateServer.jsp"> <!-- 서버주소 -->
<table border = "1">
	<tr>
		<td>작성자</td><td>제목</td><td>내용</td>
	</tr>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();
	
	// login을 하기 위한 sql문장
	// prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
	pstmt=conn.prepareStatement("select * from borad2");

		// 위 sql 문장을 실행(workbench : ctrl + enter)
		// executeQuery() : select(select된 결과를 ResultSet라는 공간에 저장해서 반환.)
		// executeUpdate() : insert, updata, delete
	rs=pstmt.executeQuery();
	//System.out.println("DB연결 성공");
	
	while(rs.next()){ 
%>
<tr>
	<td><%=rs.getString("writer") %></td>
	<td><%=rs.getString("title") %></td>
	<td><%=rs.getString("content") %></td>
</tr>
<tr>

<% 	
	}
			
}catch(Exception e){
	//System.out.println("DB연결 실패");
	e.printStackTrace();
}finally{
	conn.close();
	rs.close();
	pstmt.close();
}
%>







</table>
</form>
</body>
</html>