<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>예방접종통계</b></h2>
<form name="frm">
<table border="1">
<tr>
<td>백신코드</td>
<td>대상감염병</td>
<td>백신종류</td>
<td>정상접종횟수</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
try {
	Connection conn = Util.getConnection();
	String sql = "select ve.vaccine_code, infectious_disease, vaccines, count(vaccinate_result) "+
	"from tbl_vaccine ve, tbl_vaccination vn " +
	"where ve.VACCINE_CODE = vn.VACCINATE_CODE and vaccinate_result like 'N' " +
	"group by ve.vaccine_code, infectious_disease, vaccines " +
	"order by ve.vaccine_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {

%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
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
