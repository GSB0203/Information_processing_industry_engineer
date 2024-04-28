<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>r-list</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>참가자 등수 조회</b></h2>
<form name="frm">
<table border="1">
	<tr>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>총점</td>
		<td>평균</td>
		<td>등수</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");

	try {	

		Connection conn = Util.getConnection();
		String sql ="select a.artist_id, artist_name, sum(score), TO_CHAR(round(avg(score), 2), 'FM90.00'), rank() over(order by sum(score) desc) as rank from tbl_artist a, tbl_point p where p.artist_id = a.artist_id group by a.artist_id, artist_name order by rank";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
		int rank = rs.getInt(5);
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rank %></td>
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