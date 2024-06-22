<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="dbconnect.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String time = request.getParameter("time");
	String number = request.getParameter("number");
try {
	String sql = "update tbl_parking set departure_time = ? where trim(car_number) = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, time);
	pstmt.setString(2, number);
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>