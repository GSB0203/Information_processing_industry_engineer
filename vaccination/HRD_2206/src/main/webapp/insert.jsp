<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>예방접종이력정보 등록</b></h2>
<form method="post" action="action.jsp" name="frm">
<table border="1">
	<tr>
		<td>접종이력번호</td>
		<td><input type="text" name="no">예)A001</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id">예)C001</td>
	</tr>
	<tr>
		<td>백신코드</td>
		<td><select name="code">
			<option value="">코드선택
			<option value="1">V001
			<option value="2">V002
			<option value="3">V003
			<option value="4">V004
			<option value="5">V005
			<option value="6">V006
			<option value="7">V007
			<option value="8">V008
			<option value="9">V009
		</select>예)V008</td>
	</tr>
	<tr>
		<td>접종일자</td>
		<td><input type="text" name="date">예)230701</td>
	</tr>
	<tr>
		<td>접종회차</td>
		<td><input type="text" name="round">예)1</td>
	</tr>
	<tr>
		<td>접종결과</td>
		<td><select name="result">
			<option value="">결과선택
			<option value="1">[N]정상
			<option value="2">[A]이상
		</select>예[N]정상</td>
	</tr>
	<tr>
		<td>기관코드</td>
		<td><input type="text" name="agency">예)B023</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록" onclick="return addCheck()">
			<input type="button" value="다시쓰기" onclick="return res()">
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>