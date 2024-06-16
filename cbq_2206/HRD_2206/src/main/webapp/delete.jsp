<%@ include file="dbconnect.jsp" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>차량출차</b></h2>
<form name="frm" method="post" action="d_action.jsp">
<table border="1">
	<tr>
		<td>차량번호</td>
		<td>
			<select name="number" onchange ="get_name(this.value)">
				<option value="">차량번호</option>
<%				 		    
	try {
		String sql =  "select trim(p.car_number), c.owner_name " +
		   			  "from tbl_parking p, tbl_car c " +
					  "where p.car_number = c.car_number and departure_time is NULL";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
							
		while(rs.next()) {
%>							
				<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
<%
		}

%>
			</select>
		</td>
	</tr>
	<tr>
		<td>소유자이름</td>
		<td><input type="text" name="owner" value= "" readonly></td>
<% 
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
	</tr>
	<tr>
		<td>출차시간</td>
		<td><input type="text" name="time">예) 22:03</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" onclick="return addCheckDelete()" value="출차등록">
			<input type="button" onclick="return res()" value="다시쓰기">
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>