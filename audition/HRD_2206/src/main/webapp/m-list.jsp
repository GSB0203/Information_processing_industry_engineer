<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m-list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>멘토 점수 조회</b></h2>
<form name="frm">
<table border="1">
	<tr>
		<td>채점번호</td>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>점수</td>
		<td>평점</td>
		<td>멘토명</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");

	try {	

		Connection conn = Util.getConnection();
		String sql ="select serial_no, a.artist_id, artist_name, birth, score, mento_name from tbl_mento m, tbl_artist a, tbl_point p where a.artist_id = p.artist_id and m.mento_id = p.mento_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int score = rs.getInt(5);
			String grade="";
			if(score >= 90) grade="A";
			else if(score >= 80) grade="B";
			else if(score >= 70) grade="C";
			else if(score >= 60) grade="D";
			else grade="F";
			
			String birth = rs.getString(4);
			String re_birth = birth.substring(0,4) + "년" + birth.substring(4,6) + "월" + birth.substring(6,8) + "일";
		
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=re_birth %></td>
		<td><%=score %></td>
		<td><%=grade %></td>
		<td><%=rs.getString(6) %></td>
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

