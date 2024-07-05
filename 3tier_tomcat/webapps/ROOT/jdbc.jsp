<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
   Connection conn = null;

   String driver = "org.mariadb.jdbc.Driver";
   String url = "jdbc:mariadb://200.200.200.223:3306/vsphere";

   Boolean connect = false;

   try {
      // DriverManager 객체 생성, 등록
      Class.forName(driver);

      // MariaDB 계정 id, 비밀번호 입력
      conn = DriverManager.getConnection(url, "root", "P@ssw0rd");

      connect = true;
      conn.close();

   } catch(Exception e) {
      connect = false;
      e.printStackTrace();
   }
%>
....
<% if(connect == true) { %>
   <h3>연결되었습니다.</h3>
<% } else { %>
   <h3>연결에 실패했습니다.</h3>
<% } %>

