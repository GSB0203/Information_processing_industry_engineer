<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>차량조회</b></h2>
<form name="frm">
<table border="1">
	<tr>
		<td>차량번호</td>
		<td>차량종류</td>
		<td>소유자이름</td>
		<td>주차위치</td>
		<td>입차시간</td>
		<td>출차시간</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("number");
	try{
		String sql = "select trim(p.car_number), car_name, owner_name, location, entrance_time, departure_time " +
					 "from tbl_parking p, tbl_car c " +
					 "where trim(c.car_number) = trim(p.car_number) and trim(p.car_number) = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, number);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String d_time = rs.getString(6);
			if(d_time == null) d_time = "";
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=d_time %></td>
	</tr>
<%
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>