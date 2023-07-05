<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<%
	String seq = request.getParameter("c");
	String sql = "select seq,title,writer,content,regdate,hit from notices where seq="+seq;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";
	Connection con = DriverManager.getConnection(url,user,pw);
	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>

<form action="noticeEditProc.jsp" method="post">
<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Update</caption>
	<tbody>
	<tr>
		<th class=left>번호</th>
		<td><%=rs.getString("seq") %></td>
		<th class=left>조회수</th>
		<td><%=rs.getInt("hit") %></td>
	</tr>
	<tr>
		<th class=left>작성자</th>
		<td><%=rs.getString("writer") %></td>
		<th class=left>작성시간</th>
		<td><%=rs.getDate("regdate") %></td>
	</tr>
	<tr>
		<th class=left>제목</th>
		<td colspan=3 id=content><input type="text" class="inp" name="title" value="<%=rs.getString("title") %>"/></td>
	</tr>
	<tr>
		<th class=left>내용</th>
		<td colspan=3 id=content><textarea name="content" class="txt" cols="30" rows="10"><%=rs.getString("content") %></textarea></td>
	</tr>
	<tr>
		<th class=left>첨부</th>
		<td colspan=3 id=content>첨부</td>
	</tr>
	</tbody>
</table>
<input type="hidden" name="c" value=<%=rs.getString("seq") %> />
<input type="submit" value="수정하기" />
<a href="noticeDetail.jsp?c=<%=rs.getString("seq") %>">취소</a>
</form>
</body>
</html>