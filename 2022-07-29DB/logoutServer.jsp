<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그아웃
	session.invalidate();
out.println("<script>");
out.println("location.href='main.jsp'");
out.println("</script>");

%>
</body>
</html>