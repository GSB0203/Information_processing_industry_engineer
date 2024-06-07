<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신정보조회</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>백신정보조회</b></h2>
<form name="frm">
<table border="1">
	<tr>
		<td>백신코드</td>
		<td>대상감염병</td>
		<td>백신종류</td>
		<td>백신접종시기</td>
		<td>백신권장</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");
	
	try {
		Connection conn = Util.getConnection();
		String sql = "select * from tbl_vaccine";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String recommend = rs.getString(5);
			if(recommend == "1") recommend = "연령권장";
			else recommend = "위험군 권장";
			
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=recommend %></td>
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