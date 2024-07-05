<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="../style_contents.css" type="text/css">
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var pw = document.getElementById("pw").value;
            var email = document.getElementById("email").value;
            var sub = document.getElementById("sub").value;
            var cont = document.getElementById("cont").value;
            
            if (name === "" || pw === "" || email === "" || sub === "" || cont === "") {
                alert("모든 필드를 입력해주세요.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <iframe src="../head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
    <div id="board_contents" class="contents">
        <%-- 데이터 받아오기 --%>
        <% String b_name = request.getParameter("name"); %>
        <% String b_pw = request.getParameter("pw"); %>
        <% String b_email = request.getParameter("email"); %>
        <% String b_sub = request.getParameter("sub"); %>
        <% String b_cont = request.getParameter("cont"); %>
        <% String b_tag = request.getParameter("tag"); %>
        
        <%-- 파일 정보 받아오기 --%>
         <% String f_error = (String) request.getAttribute("att_file_error"); %>
         <% String f_name = (String) request.getAttribute("att_file_name"); %>
         <% String f_tmp = (String) request.getAttribute("att_file_tmp"); %>
         <% String f_size = (String) request.getAttribute("att_file_size"); %>

        <%-- 오라클 DB 연결 --%>
        <% Class.forName("oracle.jdbc.driver.OracleDriver"); %>
        <% Connection conn = DriverManager.getConnection("192.168.151.223", "abraxas", "2076063678"); %>
        
        <%-- 쿼리 작성 --%>
        <% String strSQL = "INSERT INTO board (strName, strPassword, strEmail, strSubject, strContent, htmlTag, writeDate"; %>
        <% if (f_error == null || f_error.equals("0")) { %>
            <% strSQL += ", filename, filesize"; %>
        <% } %>
        <% strSQL += ") VALUES (?, ?, ?, ?, ?, ?, SYSDATE"; %>
        <% if (f_error == null || f_error.equals("0")) { %>
            <% strSQL += ", ?, ?"; %>
        <% } %>
        <% strSQL += ")"; %>
        
        <%-- 쿼리 실행 --%>
        <% PreparedStatement pstmt = conn.prepareStatement(strSQL); %>
        <% pstmt.setString(1, b_name); %>
        <% pstmt.setString(2, b_pw); %>
        <% pstmt.setString(3, b_email); %>
        <% pstmt.setString(4, b_sub); %>
        <% pstmt.setString(5, b_cont); %>
        <% pstmt.setString(6, b_tag); %>
        <% if (f_error == null || f_error.equals("0")) { %>
            <% pstmt.setString(7, f_name); %>
            <% pstmt.setString(8, f_size); %>
        <% } %>
        <% int result = pstmt.executeUpdate(); %>
        
        <%-- 결과 확인 및 처리 --%>
        <% if (result > 0) { %>
            <script>alert('success.'); location.replace('board_list.jsp');</script>
        <% } else { %>
            <script>alert('fail.'); history.back();</script>
        <% } %>
        
        <%-- 연결 종료 --%>
        <% pstmt.close(); %>
        <% conn.close(); %>
    </div>
</body>
</html>

