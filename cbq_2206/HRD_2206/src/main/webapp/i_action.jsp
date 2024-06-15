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
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("number");
	String location = request.getParameter("location");
	String time = request.getParameter("time");
	try {
		String sql = "insert into tbl_parking values(?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, number);
		pstmt.setString(2, location);
		pstmt.setString(3, time);s
		pstmt.setString(4, "");
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>