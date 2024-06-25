<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>t_list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>강사조회</b></h2>
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
		String sql = "select  teacher_code, teacher_name, class_name, to_char(class_price, 'FM999,999,999,999'), teacher_regist_date from tbl_teacher_202201";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String money = rs.getString(4);
			String date = rs.getString(5);
			
			money = "\\" + money;
			date = date.substring(0,4) + "년" + date.substring(4, 6) + "월" + date.substring(6, 8) + "일";
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=money %></td>
		<td><%=date %></td>
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