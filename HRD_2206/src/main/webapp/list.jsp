<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2 style="text-align: center"><b>회원목록조회/수정</b></h2>
<form>
	<table border="1">
	<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>가입일자</td>
	<td>고객등급</td>
	<td>거주지역</td>
	</tr>
	
<%
	Connection conn = null;  //연결을 시켜줄 변수
	Statement stmt = null;  //sql을 실행 시켜줄 변수
	String grade = " ";
	try {
		conn = Util.getConnection();  //DB 연결
		stmt = conn.createStatement();  //sql을 실행시키기 위한 변수 생성
		String sql = "select * from member_tbl_02 order by custno";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			grade = rs.getString("grade");
			switch(grade) {
			case "A" :
				grade = "VIP";
				break;
			case "B" :
				grade = "일반";
				break;
			case "C" :
				grade = "직원";
				break;
			}
%>
	<tr>
		<td><a href="modify.jsp?mod_custno=<%=rs.getString("custno")%>"> <%=rs.getString("custno")%></a></td>
		<td><%=rs.getString("custname")%></td>
		<td><%=rs.getString("phone")%></td>
		<td><%=rs.getString("address")%></td>
		<td><%=rs.getString("joindate")%></td>
		<td><%=grade%></td>
		<td><%=rs.getString("city")%></td>
	</tr>
	<!-- a태그를 통해서 수정페이지로 이동을 하고, ?(url 파라미터)를 통해 해당페이지로 이동할때, 그 페이지에서 요구하는 속성이나 데이터를 전달-->
<%		
		}
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