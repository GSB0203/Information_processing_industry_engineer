<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>차량조회</b></h2>
<form name="frm" method="post" action="l_action.jsp">
<table border="1">
	<tr>
		<td>차량번호를 입력하시오.</td>
		<td><input type="text" name="number"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" onclick="return addCheckList()" value="차량조회">
			<input type="button" onclick="window.location = 'index.jsp'" value="홈으로">
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>