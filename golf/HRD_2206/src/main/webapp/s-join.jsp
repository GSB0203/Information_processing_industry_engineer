<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s-join</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>회원정보조회</h2>
<form name="frm">
<table border="1">
<tr>
	<td>수강월</td>
	<td>회원번호</td>
	<td>회원명</td>
	<td>강의명</td>
	<td>강의장소</td>
	<td>수강료</td>
	<td>등급</td>
</tr>

<%
	request.setCharacterEncoding("UTF-8");

try {
	Connection conn = Util.getConnection();
	String sql = "SELECT regist_month, m.c_no, c_name, class_name, class_area, tuition, grade FROM tbl_member m, tbl_class c, tbl_teacher t " + 
	             "where c.c_no = m.c_no and t.teacher_code = c.teacher_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		int money = rs.getInt(6);
		String r_money = "₩" + money;
		String date = rs.getString(1);
		date = date.substring(0,4) + "년" + date.substring(4, 6) + "월";
		
%>
	<tr>
		<td><%= date %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= r_money %></td>
		<td><%= rs.getString(7) %></td>
	</tr>	
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}

%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>