<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>d_action</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
	try
	{
		String sql = "DELETE FROM giants_player WHERE pid=?";
		PreparedStatement ps  = conn.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(pid));
		ps.executeUpdate();
	
%>
    <jsp:forward page="p_list.jsp"></jsp:forward>
	
<% 
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>