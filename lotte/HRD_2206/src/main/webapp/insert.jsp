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
		String sql="select max(pid) from giants_player";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
%>
	<tr>
		<td>선수번호</td>
		<td><input type="text" name="pid" value="<%=rs.getInt(1) + 1 %>" readonly></td>
	</tr>
<%
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
	<tr>
		<td>선수이름</td>
		<td><input type="text" name="pname"></td>
	</tr>
	<tr>
		<td>선수포지션</td>
		<td>
			<select name="pposition">
				<option value="">포지션선택
				<option value="투수">투수
				<option value="내야수">내야수
				<option value="외야수">외야수
				<option value="포수">포수
			</select>
		</td>
	</tr>
	<tr>
		<td>선수등록일</td>
		<td><input type="text" name="pdate"></td>
	</tr>
	<tr>
		<td>선수등급</td>
		<td>
			<input type="radio" name="pgrade" value="S">S
			<input type="radio" name="pgrade" value="A">A
			<input type="radio" name="pgrade" value="B">B
			<input type="radio" name="pgrade" value="C">C
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" onclick="return addCheck()" value="등록">
			<input type="reset" onclick="alert('정보를 지우고 처음부터 다시 입력합니다')" value="다시쓰기">
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>