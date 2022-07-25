<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// loginForm.jsp에 있는 데이터 수집
	String id=request.getParameter("id"); // request 요청
	String pw=request.getParameter("pw");
 	
	System.out.println(id);
	System.out.println(pw);

%>

</body>
</html>