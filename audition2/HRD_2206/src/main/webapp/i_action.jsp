<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String name=request.getParameter("name");
String birth=request.getParameter("birth1") + request.getParameter("birth2") + request.getParameter("birth3");
String gender=request.getParameter("gender");
String talent=request.getParameter("talent");
String agency=request.getParameter("agency");
try{
   Connection conn = Util.getConnection();
   String sql= "insert into tbl_artist values(?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1,id);
   pstmt.setString(2,name);
   pstmt.setString(3,birth);
   pstmt.setString(4,gender);
   pstmt.setString(5,talent);
   pstmt.setString(6,agency);
   
   pstmt.executeUpdate();
%>
<jsp:forward page="insert.jsp"></jsp:forward>
<% 
}
catch(Exception e){
   e.printStackTrace();
}
%>
</body>
</html>