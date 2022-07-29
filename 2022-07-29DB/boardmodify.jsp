<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
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
<h1 align="center">수정 내용 화면</h1>
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
<form>
<input type ="hidden" name ="bon" value="<%=rs.getString("bon") %>">
<table border ="0" align="center">
	<tr>
		<td>제목</td>
		<td>
		<input type ="text" name ="title" id="title" value="<%=rs.getString("title") %>">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<textarea rows="30px" cols="100px" name="content"><%=rs.getString("content") %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" id="button" value="수정" formaction="boardmodifyServer.jsp">
		<input type="submit" id="button" value="삭제" formaction="boardremoveServer.jsp">
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