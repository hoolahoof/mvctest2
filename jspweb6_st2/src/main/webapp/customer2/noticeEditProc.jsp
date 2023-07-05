<%@page import="customer.vo.Notice"%>
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
<title>Updating</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String seq =request.getParameter("c");
String title = request.getParameter("title");
String content = request.getParameter("content");
 
 Notice n = new Notice();
 n.setTitle(title);
 n.setContent(content);
 n.setSeq(seq);
 
 NoticeDao2 dao = new NoticeDao2();
/*  dao.update(n); */
 dao.update2(seq,title,content);
 
response.sendRedirect("noticeDetail.jsp?c="+seq);
%>
</body>
</html>