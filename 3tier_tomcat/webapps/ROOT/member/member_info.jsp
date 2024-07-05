<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    <title>회원 정보</title>
</head>
<body>
    <h1>회원 정보</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>나이</th>
            <th>닉네임</th>
            <th>이메일</th>
        </tr>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.naming.*, javax.sql.*" %>
        <%!
            String db_username = "root"; // 데이터베이스 사용자 이름
            String db_password = "P@ssw0rd"; // 데이터베이스 비밀번호
            String db_url = "jdbc:mariadb://200.200.200.223:3306/vsphere"; // 데이터베이스 URL
        %>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // 오라클 데이터베이스 연결
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(db_url, db_username, db_password);

                // 세션에서 로그인한 사용자의 아이디 가져오기
                String user_id = (String) session.getAttribute("user_id");
                if(user_id == null) {
                    out.println("<h3>로그인 후 이용 가능합니다.</h3>");
                } else {
                    // 회원 정보 조회 쿼리
                    String query = "SELECT * FROM member WHERE user_id = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, user_id);
                    rs = pstmt.executeQuery();

                    // 회원 정보 출력
                    if(rs.next()) {
                        String name = rs.getString("name");
                        int age = rs.getInt("age");
                        String nick = rs.getString("nick");
                        String email = rs.getString("email");

                        // 테이블에 데이터 표시
        %>
                        <tr>
                            <td><%= user_id %></td>
                            <td><%= name %></td>
                            <td><%= age %></td>
                            <td><%= nick %></td>
                            <td><%= email %></td>
                        </tr>
        <%
                    } else {
                        out.println("<h3>회원 정보를 찾을 수 없습니다.</h3>");
                    }
                }
            } catch(Exception e) {
                out.println("<h3>오류 발생: " + e.getMessage() + "</h3>");
            } finally {
                // 자원 해제
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>

