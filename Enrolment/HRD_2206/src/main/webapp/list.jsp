<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>교과목 목록</h2>
<form>
	<table border="1">
	<tr>
		<td>과목 코드</td>
		<td>과목명</td>
		<td>학점</td>
		<td>담당강사</td>
		<td>요일</td>
		<td>시작시간</td>
		<td>종료시간</td>
		<td>삭제</td>
	</tr>
	</table>
</form>
</section>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>