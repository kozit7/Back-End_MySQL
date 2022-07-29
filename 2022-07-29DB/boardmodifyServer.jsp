<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<%
	// 데이터 수집
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	int bon=Integer.parseInt(request.getParameter("bon"));
	
	// DB관련 처리
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	
	// spl문장 처리
		try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		// prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
		pstmt=conn.prepareStatement("update board2 set title = ?, content = ? where bon = ?");
		// 첫번째 물음표에는 사용자가 입력한title값(request.getParameter("title"))을 설정
		pstmt.setString(1, title);
		// 두번째 물음표에는 사용자가 입력한writer값(request.getParameter("writer"))을 설정
		pstmt.setString(2, content);
		// 두번째 물음표에는 사용자가 입력한bon값(request.getParameter("bon"))을 설정
		pstmt.setInt(3, bon);
		
		int result=pstmt.executeUpdate();
		
		if(result==1){
			// boarddetail.jsp 화면으로 이동
			out.println("<script>");
			out.println("location.href='boardlist2.jsp?bon="+bon+"'");//+bon+는 데이터 수집의bon
			out.println("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		pstmt.close();
	}

%>
</body>
</html>