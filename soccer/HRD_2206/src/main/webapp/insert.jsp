<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>선수 등록</b></h2>
<form name="frm" method="post" action="i_action.jsp">
<table border="1">
<%
	request.setCharacterEncoding("UTF-8");
	try {
		String sql = "select max(player_id) + 1 from tbl_player_20221205";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
%>
	<tr>
		<td>선수ID</td>
		<td><input type="text" name="player_id" value="<%=rs.getString(1)%>" readonly></td>
	</tr>
<%
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
	<tr>
		<td>선수이름</td>
		<td><input type="text" name="player_name"></td>
	</tr>
	<tr>
		<td>포지션</td>
		<td>
			<input type="radio" name="player_position" value="GK">골키퍼
			<input type="radio" name="player_position" value="FW">수비수
			<input type="radio" name="player_position" value="MF">미드필더
			<input type="radio" name="player_position" value="DF">공격수
		</td>
	</tr>
	<tr>
		<td>선수등록일</td>
		<td><input type="text" name="player_date"></td>
	</tr>
	<tr>
		<td>소속팀</td>
		<td>
			<select name="team_id">
				<option value="">무소속
				<option value="울산현대">울산현대
				<option value="삼성블루윙증">삼성블루윙증
				<option value="스틸러스">스틸러스
				<option value="유나이티드">유나이티드
				<option value="현대모터스">현대모터스
				<option value="부산소마고">부산소마고
				<option value="드래곤즈">드래곤즈
				<option value="일화천마">일화천마
				<option value="FC서울">FC서울
				<option value="시티즌">시티즌
				<option value="경남FC">경남FC
				<option value="광주상무">광주상무
				<option value="강원FC">강원FC
				<option value="제주유나이티드FC">제주유나이티드FC
				<option value="대구FC">대구FC
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="추가" onclick="return ">
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>