<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String artist_id = request.getParameter("id");
	String artist_name = request.getParameter("name");
	String birth = (request.getParameter("year") + request.getParameter("month") + request.getParameter("day"));
	String gender = request.getParameter("gender");
	if(gender.equals("1")) gender="M";
	else if(gender.equals("2")) gender="F";
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");
	try {
		Connection conn = Util.getConnection();
		String sql = "insert into tbl_artist values(?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, artist_id);
		pstmt.setString(2, artist_name);
		pstmt.setString(3, birth);
		pstmt.setString(4, gender);
		pstmt.setString(5, talent);
		pstmt.setString(6, agency);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<jsp:forward page="p-list.jsp"></jsp:forward>