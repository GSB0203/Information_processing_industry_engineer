<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m-join</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>강사매출현황</h2>
<form name="frm">
<table border="1">
<tr>
	<td>강사코드</td>
	<td>강의명</td>
	<td>강사명</td>
	<td>총매출</td>
</tr>

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	String sql = "select t.teacher_code, class_name, teacher_name, sum(tuition) from tbl_teacher t, tbl_class c " +
				 "where c.teacher_code = t.teacher_code " + 
				 "group by t.teacher_code, class_name, teacher_name " +
				 "order by t.teacher_code desc";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		int money = rs.getInt(4);
		String r_money = "₩" + money;
%>
<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=r_money %></td>
</tr>

<%
	}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>