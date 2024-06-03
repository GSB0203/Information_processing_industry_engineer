<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
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
<h2>참가자 목록 조회</h2>
   <form name="frm">
   <table border="1" style="text-align:center">
   <tr>
   <td>참가번호</td>
   <td>참가자명</td>
   <td>생년월일</td>
   <td>성별</td>
   <td>특기</td>
   <td>소속사</td>
   </tr>
<%
   try {
      Connection conn = Util.getConnection();
      String sql = "select * from tbl_artist";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      while(rs. next()) {
         String resbrith = rs.getString(3);
         String birth = resbrith.substring(0,4) + "년" + resbrith.substring(4,6) + "월" + resbrith.substring(6,8) + "일";
         String talent = rs.getString(5);
         if(talent.equals("1")) talent = "보컬";
         else if(talent.equals("2")) talent = "댄스";
         else if(talent.equals("3")) talent = "랩";
%>
      <tr>
         <td><%=rs.getString(1) %></td>
         <td><%=rs.getString(2) %></td>
         <td><%=birth %></td>
         <td><%=rs.getString(4) %></td>
         <td><%=talent %></td>
         <td><%=rs.getString(6) %></td>
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