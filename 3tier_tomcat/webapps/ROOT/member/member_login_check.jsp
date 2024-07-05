<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // 데이터베이스 연결 정보
    String db_username = "root";  // 데이터베이스 사용자 이름
    String db_password = "P@ssw0rd";    // 데이터베이스 비밀번호
    String db_hostname = "200.200.200.223";  // 호스트 이름
    String db_port = "3306";        // 포트 번호
    String db_name = "vsphere"; // 서비스 이름

    // 데이터베이스 연결
    Connection conn = null;
    try {
        // JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");
        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:mariadb://" + db_hostname + ":" + db_port + "/" + db_name, db_username, db_password);
    } catch (Exception e) {
        // 연결 실패 시 오류 메시지 출력
        out.println("데이터베이스 연결에 실패했습니다.");
        e.printStackTrace();
    }

    // 연결 성공 시 로그인 처리
    if (conn != null) {
        String id = request.getParameter("user_id");
        String pw = request.getParameter("password"); // 수정된 부분

        if (id == null || id.isEmpty() || pw == null || pw.isEmpty()) {
            // 아이디와 패스워드 모두 입력되지 않은 경우
            out.println("아이디와 패스워드를 모두 입력해주세요.");
        } else {
            try {
                // 오라클 DB 쿼리
                String query = "SELECT * FROM member WHERE user_id=? AND password=?"; // 수정된 부분
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, id);
                pstmt.setString(2, pw);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // 로그인 성공
                    String user_id = rs.getString("user_id");
                    String nick = rs.getString("nick");

                    // 세션에 사용자 정보 저장
                    session.setAttribute("user_id", user_id); // 비밀번호는 세션에 저장하지 않음
		    session.setAttribute("nick", nick);
                    out.println("로그인 되었습니다.");
                    response.sendRedirect("../insertForm.jsp");
                } else {
                    // 아이디 또는 패스워드가 일치하지 않는 경우
                    out.println("아이디 또는 패스워드가 일치하지 않습니다.");
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                out.println("데이터베이스 오류가 발생했습니다.");
                e.printStackTrace();
            }
        }
    }
%>

