<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2><b>홈쇼핑 회원 등록</b></h2>
	<form method="post" action="action.jsp" name="frm">
	
	<input type="hidden" name="mode" value="insert">
	
	<table border="1">
<%
	Connection conn = null;  //연결을 시켜줄 변수
	Statement stmt = null;  //sql을 실행 시켜줄 변수
	String custno = " ";
	try{
	      conn = Util.getConnection();//db 연결
	      stmt = conn.createStatement();//sql을 실행시키기 위한 변수를 생성
	      String sql = "select MAX(custno)+1 custno from member_tbl_02 ";
	      ResultSet rs = stmt.executeQuery(sql);
	      rs.next();
	      custno=rs.getString("custno");
	   }catch(Exception e){
	      e.printStackTrace();
	   }
	%>   

		<tr>
			<td>회원번호(자동등록)</td>
			<td><input type="text" name="custno" value=<%=custno %> readonly></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="등록" onclick="return joinCheck()">
		<input type="button" value="조회" onclick="return search()">
		</td>
		</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>