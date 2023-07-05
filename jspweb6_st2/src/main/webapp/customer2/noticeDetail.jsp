<%@page import="customer.dao2.NoticeDao2"%>
<%@page import="customer.vo.Notice"%>
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
<title>boardDetail</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<%
	String seq = request.getParameter("c");
	
	NoticeDao2 dao = new NoticeDao2();
	Notice n = dao.getNotice(seq);
	%>
	<table class="twidth">
		<colgroup>
			<col width=15% />
			<col width=35% />
			<col width=15% />
			<col width=35% />
		</colgroup>
		<caption>Detail Board</caption>

		<tbody>
			<tr>
				<th class=left>번호</th>
				<td><%=n.getSeq()%></td>
				<th class=left>조회수</th>
				<td><%=n.getHit()%></td>
			</tr>
			<tr>
				<th class=left>작성자</th>
				<td><%=n.getWriter()%></td>
				<th class=left>작성시간</th>
				<td><%=n.getRegdate()%></td>
			</tr>
			<tr>
				<th class=left>내용</th>
				<td colspan=3 id=content><%=n.getContent()%></td>
			</tr>
			<tr>
				<th class=left>첨부</th>
				<td colspan=3 id=content>첨부</td>
			</tr>
		</tbody>

	</table>
	<a href="noticeEdit.jsp?c=<%=n.getSeq()%>">수정</a>
	<a href="noticeDel.jsp?c=<%=n.getSeq()%>">삭제</a>
	<a href="notice.jsp">목록</a>
</body>
</html>
