<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
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

String v_no = request.getParameter("v_no");
String v_id = request.getParameter("v_id");
String v_code = request.getParameter("v_code");
String v_date = request.getParameter("v_date");
String v_round = request.getParameter("v_round");
String v_result = request.getParameter("v_result");
String v_agency = request.getParameter("v_agency");
try{
	Connection conn = Util.getConnection();
String sql = "insert into tbl_vaccination values(?, ?, ?, ?, ?, ?, ?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, v_no);
pstmt.setString(2, v_id);
pstmt.setString(3, v_code);
pstmt.setString(4, v_date);
pstmt.setString(5, v_round);
pstmt.setString(6, v_result);
pstmt.setString(7, v_agency);

conn.commit();
pstmt.executeUpdate();
} catch(Exception e) {
e.printStackTrace();
}
%>
<jsp:forward page="list2.jsp"></jsp:forward>
</body>
</html>
