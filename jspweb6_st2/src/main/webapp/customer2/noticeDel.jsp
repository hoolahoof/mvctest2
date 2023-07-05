<%@page import="customer.dao2.NoticeDao2"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String seq = request.getParameter("c");

NoticeDao2 dao = new NoticeDao2();
int del = dao.delete(seq);

if(del == 1){
	response.sendRedirect("notice.jsp");
}else{
	out.write("삭제오류");
}
%>
</body>
</html>