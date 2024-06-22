<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>선수 정보 수정</b></h2>
<form name="frm" method="post" action="m_action.jsp">
<table border="1">
<%
	request.setCharacterEncoding("UTF-8");
	String pid = request.getParameter("pid");
	try {
		String sql = "select * from giants_player where pid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pid);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {		
%>
	<tr>
		<td>선수번호</td>
		<td><input type="text" name="pid" value="<%=rs.getString(1) %>" readonly></td>
	</tr>
	<tr>
		<td>선수이름</td>
		<td><input type="text" name="pname" value="<%=rs.getString(2) %>"></td>
	</tr>
	<tr>
		<td>선수포지션</td>
		<td>
			<select name="pposition">
				<option value="투수" <%if(rs.getString(3).equals("투수")) out.println("selected"); %>>투수
				<option value="내야수" <%if(rs.getString(3).equals("내야수")) out.println("selected"); %>>내야수
				<option value="외야수" <%if(rs.getString(3).equals("외야수")) out.println("selected"); %>>외야수
				<option value="포수" <%if(rs.getString(3).equals("포수")) out.println("selected"); %>>포수
			</select>
	</tr>
	<tr>
		<td>선수등록일</td>
		<td><input type="text" name="pdate" value="<%=rs.getString(4) %>"></td>
	</tr>
	<tr>
		<td>선수등급</td>
		<td>
			<input type="radio" name="pgrade" value="S" <%if(rs.getString(5).equals("S")) out.println("checked"); %>>S
			<input type="radio" name="pgrade" value="A" <%if(rs.getString(5).equals("A")) out.println("checked"); %>>A
			<input type="radio" name="pgrade" value="B" <%if(rs.getString(5).equals("B")) out.println("checked"); %>>B
			<input type="radio" name="pgrade" value="C" <%if(rs.getString(5).equals("C")) out.println("checked"); %>>C
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" onclick="return addModify()" value="수정">
			<input type="button" onclick="cancel()" value="취소"> 
		</td>
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