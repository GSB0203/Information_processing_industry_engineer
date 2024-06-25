<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String regist_month = request.getParameter("regist_month");
	String c_no = request.getParameter("c_name");
	String class_area = request.getParameter("class_area");
	String teacher_code = request.getParameter("class_name");
	String tuition = request.getParameter("tuition");
	
	try {
		String sql = "insert into tbl_class_202201 values(?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, regist_month);
		pstmt.setString(2, c_no);
		pstmt.setString(3, class_area);
		pstmt.setString(4, tuition);
		pstmt.setString(5, teacher_code);
		
		pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>