<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>수강신청</h2>
<form name="frm">
<table>
<tr>
	<td>수강월</td>
	<td><input type="text" name="regist_month"></td>
</tr>
<tr>
	<td>회원명</td>
	<td><input type="" name="c_name"></td>
</tr>
<tr>
	<td>회원번호</td>
	<td><input type="" name="c_no"></td>
</tr>
<tr>
	<td>강의장소</td>
	<td><input type="" name="class_area"></td>
</tr>
<tr>
	<td>강의명</td>
	<td><input type="" name="class_name"></td>
</tr>
<tr>
	<td>수강료</td>
	<td><input type="" name="class_price"></td>
</tr>
<tr>
	<td></td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>