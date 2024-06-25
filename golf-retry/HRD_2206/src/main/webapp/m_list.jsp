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
		String sql = "select regist_month, m.c_no, c_name, class_name, class_area, tuition, grade " +
					 "from tbl_class_202201 c, tbl_member_202201 m, tbl_teacher_202201 t" +
					 "where c.c_no = m.c_no and t.teacher_code = c.teacher_code";
	}catch(Exception e) {
		e.printStackTrace();
	}
%>	
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>