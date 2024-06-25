<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tm_list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>강사매출현황</b></h2>
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
	try {
		String sql = "select teacher_code, class_name, teacher_name, to_char(sum(tuition), 'FM999,999,999') " +
					 "from tbl_class_202201 natural join tbl_teacher_202201 " +
					 "group by teacher_code, class_name, teacher_name";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String money = "\\" + rs.getString(4);
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=money %></td>
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