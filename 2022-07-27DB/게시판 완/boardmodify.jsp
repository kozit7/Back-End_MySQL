<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면 이동</title>
</head>
<body>
<h1>수정 내용 화면</h1>
	<%
//DB연결
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();
	
	pstmt=conn.prepareStatement("select * from board where bon=5");

	rs=pstmt.executeQuery();

		if(rs.next()){ 
%>
<form>
<table border ="1">
	<tr>
		<td>제목</td>
		<td>
		<input type ="text" name ="title" value="<%=rs.getString("title") %>">
		</td>
	</tr>
	<tr>
		<td>내용</td
		><td>
		<textarea rows="10px" cols="20px" name="content"><%=rs.getString("content") %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit"value="수정" formaction="boardmodifyServer.jsp">
		<input type="submit"value="삭제" formaction="boardremoveServer.jsp">
		</td>
	</tr>
</table>
</form>
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