<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String pid = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String pposition = request.getParameter("pposition");
	String pdate = request.getParameter("pdate");
	String pgrade = request.getParameter("pgrade");
	try{
		String sql="update giants_player set pname=?, pposition=?, pdate=?, pgrade=? where pid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setString(2, pposition);
		pstmt.setString(3, pdate);
		pstmt.setString(4, pgrade);
		pstmt.setString(5, pid);
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<jsp:forward page="p_list.jsp"></jsp:forward>
</body>
</html>