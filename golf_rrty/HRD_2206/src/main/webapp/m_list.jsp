<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m_list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>회원정보조회</b></h2>
<form name="frm" style="display:flex; align-items:center; justify-content:center;">
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
		String sql = "select regist_month, c_no, c_name, class_name, class_area, to_char(tuition, 'FM999,999,999'), grade " +
					 "from tbl_member_202201 natural join tbl_class_202201 natural join tbl_teacher_202201";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String date = rs.getString(1);
			date = date.substring(0, 4) + "년" + date.substring(4, 6) + "월";
			String money = "\\" + rs.getString(6);
%>
	<tr>
		<td><%=date %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=money %></td>
		<td><%=rs.getString(7) %></td>
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