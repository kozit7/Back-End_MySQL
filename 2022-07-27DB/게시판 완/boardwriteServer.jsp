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
<%
	// 데이터 수집
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	// DB관련 처리
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	// spl문장 처리
		try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		// prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
		pstmt=conn.prepareStatement("insert into board(title,content) values(?,?)");
		// 첫번째 물음표에는 사용자가 입력한title값(request.getParameter("title"))을 설정
		pstmt.setString(1, title);
		// 두번째 물음표에는 사용자가 입력한writer값(request.getParameter("writer"))을 설정
		pstmt.setString(2, content);
		
		pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		pstmt.close();
	}

%>
</body>
</html>