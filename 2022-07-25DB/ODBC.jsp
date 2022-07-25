<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> <!-- 자바의 언어를 사용할수있게 import를 해줌 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Connection conn=null;

	try{
		// 드라이브 로드
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/information?serverTimezone=Asia/Seoul","root","1234");
																			   //serverTimezone 현재시간을 맞춰줌
		System.out.println("DB연결 성공");
																			   
		conn.close();
	}catch(Exception e){
		System.out.println("DB연결 실패");
		e.printStackTrace();
	}



%>


</head>
<body>

</body>
</html>