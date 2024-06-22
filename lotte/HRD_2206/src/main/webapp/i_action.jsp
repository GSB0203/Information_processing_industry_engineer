<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String pposition = request.getParameter("pposition");
String pdate = request.getParameter("pdate");
String pgrade = request.getParameter("pgrade");
	try {
	String sql = "insert into giants_player values(?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pid);
	pstmt.setString(2, pname);
	pstmt.setString(3, pposition);
	pstmt.setString(4, pdate);
	pstmt.setString(5, pgrade);
	pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<jsp:forward page="p_list.jsp"></jsp:forward>
</body>
</html>