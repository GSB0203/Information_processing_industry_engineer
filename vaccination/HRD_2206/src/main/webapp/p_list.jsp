<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p_list</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>예방접종이력조회</b></h2>
<form name="frm">
<table border="1">
	<tr>
		<td>접종이력번호</td>
		<td>아이디</td>
		<td>성명</td>
		<td>백신코드</td>
		<td>백신종류</td>
		<td>백신권장</td>
		<td>접종일자</td>
		<td>접종회차</td>
		<td>접종결과</td>
		<td>기관이름</td>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");
	
	try {
		Connection conn = Util.getConnection();
		String sql = "select vn.vaccinate_no, p.people_id, p.people_name, vn.vaccinate_code, ve.vaccines, ve.vaccine_recommendation, vn.vaccinate_date, vn.vaccinate_round, vn.vaccinate_result, i.institutional_name " +
					 "from tbl_people p, tbl_vaccination vn, tbl_vaccine ve, tbl_institutional i " +
					 "where p.people_id = vn.people_id and vn.vaccinate_code = ve.vaccine_code and vn.visit_agency = i.visit_agency " +
					 "order by vn.vaccinate_no";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int rrecommend = rs.getInt(6);
			String recommend = "";
			
			if(rrecommend == 1) recommend = "연령권장";
			else recommend = "위험군권장";
			
			String date = rs.getString(7);
			date = "20" + date.substring(0, 2) + "/" + date.substring(2, 4) + "/" + date.substring(4, 6);
			
			String round = rs.getString(8);
			round = round + "회차";
			
			String result = rs.getString(9);
			//if(result == "A") result = "이상";
			//else result = "정상";
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=recommend %></td>
		<td><%=date %></td>
		<td><%=round %></td>
		<td><%=result %></td>
		<td><%=rs.getString(10) %></td>
	</tr>
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