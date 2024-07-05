<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maria DB Connect Test</title>
</head>
<body>
<%
    // 마리아 데이터베이스 연결 정보
    String db_username = "root";    // 데이터베이스 사용자 이름
    String db_password = "P@ssw0rd"; // 데이터베이스 비밀번호
    String db_hostname = "200.200.200.223"; // 호스트 이름
    String db_port = "3306"; // 포트 번호
    String db_name = "vsphere"; // DB 이름
    Connection conn = null;

    try {
        // 마리아 데이터베이스 연결
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://" + db_hostname + ":" + db_port + "/" + db_name, db_username, db_password);
        
        // 연결 성공 시 메시지 출력
        out.println("<p>마리아 데이터베이스에 성공적으로 연결되었습니다.</p>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>마리아DB JDBC 드라이버를 찾을 수 없습니다.</p>");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>마리아 데이터베이스 연결 중 오류가 발생했습니다.</p>");
    } finally {
        // 연결 종료
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>마리아 데이터베이스 연결 종료 중 오류가 발생했습니다.</p>");
            }
        }
    }
%>
</body>
</html>

