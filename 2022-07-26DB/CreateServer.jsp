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
// 사용자가 입력한 title값을 title변수에 저장
String title=request.getParameter("title");
// 사용자가 입력한 writer값을 writer변수에 저장
String writer=request.getParameter("writer");

//DB연결
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		// 회원가입을 하기 위한 sql문장
		// prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
		pstmt=conn.prepareStatement("select * from board2");
		// 첫번째 물음표에는 사용자가 입력한title값(request.getParameter("title"))을 설정
		pstmt.setString(1, title);
		// 두번째 물음표에는 사용자가 입력한writer값(request.getParameter("writer"))을 설정
		pstmt.setString(2, writer);
		
		int result=pstmt.executeUpdate();

		// insert가 되었으면(게시물 작성완료페이지)
		if(result!=0){
			// 게시물 화면으로 이동
			out.println("<script>");
			out.println("location.href='Create.jsp'");
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