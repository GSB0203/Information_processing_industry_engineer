<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2><b>홈쇼핑 회원 정보 수정</b></h2>
	<form method="post" action="action.jsp" name="frm">
	
	<input type="hidden" name="mode" value="modify">
	
	<table border="1">
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;  //연결을 시켜줄 변수
	Statement stmt = null;  //sql을 실행 시켜줄 변수
	String mod_custno = request.getParameter("mod_custno");
	String custname = " ";
	String phone = " ";
	String address = " ";
	Date joindate;
	String grade = " ";
	String city = " ";
	String joindateStr =" ";
	
	try {
		conn = Util.getConnection();  //DB 연결
		stmt = conn.createStatement();  //sql을 실행시키기 위한 변수 생성
		String sql = "SELECT * from member_tbl_02 where custno = " + mod_custno;
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		mod_custno = rs.getString("custno");
		custname = rs.getString("custname");
		phone = rs.getString("phone");
		address = rs.getString("address");
		joindate = rs.getDate("joindate");
		grade = rs.getString("grade");
		city = rs.getString("city");
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		joindateStr = transFormat.format(joindate);
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
		<tr>
			<td>회원번호(자동등록)</td>
			<td><input type="text" name="custno" value=<%=mod_custno %> readonly></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" value=<%=custname%>></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" value=<%=phone%>></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" value=<%=address%>></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" value=<%=joindateStr%>></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td><input type="text" name="grade" value=<%=grade%>></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" value=<%=city%>></td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="등록" onclick="return modify()">
		<input type="button" value="조회" onclick="return search()">
		</td>
		</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>