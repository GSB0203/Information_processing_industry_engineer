<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c_list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>롯데자이언츠 코치별 관리 선수 목록</b></h2>

<form name="frm">
<table border="1">
	<tr>
		<td>코치번호</td>
		<td>코치이름</td>
		<td>코치포지션</td>
		<td>관리선수</td>
		<td>관리선수연봉합계</td>
		<td>관리선수평균연봉</td>
		<td>관리선수최대연봉</td>
		<td>관리선수최소연봉</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");
	try {
		String sql="select c.cid, c.cname, c.cposition, count(m.pid), sum(m.pcost), avg(m.pcost), max(m.pcost), min(m.pcost) " +
				   "from giants_coach c, giants_money m " +
				   "where c.cid = m.cid " +
				   "group by c.cid, c.cname, c.cposition " +
				   "order by sum(m.pcost) desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String pcnt = rs.getString(4) + "명";
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=pcnt %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getString(8) %></td>
	</tr>			
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>