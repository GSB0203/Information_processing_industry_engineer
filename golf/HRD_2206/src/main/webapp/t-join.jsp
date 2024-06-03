<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>t-join</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>강사조회</h2>
<form name="frm">
<table border="1">
	<tr>
	<td>강사코드</td>
	<td>강사명</td>
	<td>강의명</td>
	<td>수강료</td>
	<td>강사자격취득일</td>
	</tr>
	
<%
	request.setCharacterEncoding("UTF-8");

try {
	Connection conn = Util.getConnection();
	String sql = "SELECT teacher_code, teacher_name, class_name, class_price,teacher_regist_date FROM tbl_teacher";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		int money = rs.getInt(4);
		String r_money = "₩" + money;
		String date = rs.getString(5);
		date = date.substring(0,4) + "년" + date.substring(4, 6) + "월" + date.substring(6, 8) + "일";
		
%>
	<tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= r_money %></td>
		<td><%= date %></td>
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