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
		String sql ="insert into tbl_parking values(?, ?, ?, ?)";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,number);
		ps.setString(2,location);
		ps.setString(3,time);
		ps.setString(4,"");
		ps.executeQuery();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>