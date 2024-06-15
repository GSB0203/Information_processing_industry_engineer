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
	try{
		request.setCharacterEncoding("UTF-8");
		String number = request.getParameter("number");
		System.out.println(number);
		String sql = "select c.car_number, car_name, owner_name, location, entrance_time, departure_time " +
					 "from tbl_parking p, tbl_car c " +
					 "where c.car_number = p.car_number and c.car_number like ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + number + "%");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
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