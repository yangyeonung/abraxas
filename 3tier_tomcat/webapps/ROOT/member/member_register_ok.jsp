<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
</head>
<body>
<%
    // 오라클 데이터베이스 연결 정보
    String db_username = "root";
    String db_password = "P@ssw0rd";
    String db_hostname = "200.200.200.223";
    String db_port = "3306";
    String db_name = "vsphere";

    // 사용자로부터 입력받은 값
    String id = request.getParameter("user_id");
    String name = request.getParameter("name");
    String password = request.getParameter("user_pw1");
    String email = request.getParameter("email");
    String ageStr = request.getParameter("age");
    int age = 0;
    if (ageStr != null && !ageStr.isEmpty()) {
        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            out.println("<script>alert('나이 입력이 올바르지 않습니다.'); history.back();</script>");
            return;
        }
    }
    String nick = request.getParameter("nick");
    if (nick == null || nick.isEmpty()) {
        nick = name;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
		Class.forName("org.mariadb.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mariadb://" + db_hostname + ":" + db_port + "/" + db_name, db_username, db_password);
        // 이미 존재하는 아이디인지 확인하는 쿼리
        String checkQuery = "SELECT user_id FROM member WHERE user_id = ?";
        pstmt = conn.prepareStatement(checkQuery);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            out.println("<script>alert('이미 사용 중인 아이디입니다.'); history.back();</script>");
        } else {
            // 회원 가입 정보를 데이터베이스에 삽입하는 쿼리
            String insertQuery = "INSERT INTO member (user_id, name, password, age, nick, email) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, password);
            pstmt.setInt(4, age);
            pstmt.setString(5, nick);
            pstmt.setString(6, email);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<script>alert('회원 가입이 완료되었습니다.'); location.replace('../insertForm.jsp');</script>");
            } else {
                out.println("<script>alert('회원 가입에 실패했습니다.');</script>");
            }
        }
    } catch (Exception e) {
        out.println("<script>alert('오류가 발생했습니다: " + e.getMessage() + "');</script>");
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
