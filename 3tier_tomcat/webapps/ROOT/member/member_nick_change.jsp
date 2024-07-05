<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // 세션 시작
    HttpSession session = request.getSession();

    // 닉네임 파라미터 가져오기
    String nick = request.getParameter("nick");

    // 닉네임이 없는 경우 처리
    if (nick == null || nick.trim().isEmpty()) {
        out.println("<script>alert('닉네임을 입력하세요'); history.back();</script>");
        return;
    }

    // DB 연결 정보 설정
    String db_username = "root";  // 데이터베이스 사용자 이름
    String db_password = "P@ssw0rd";    // 데이터베이스 비밀번호
    String url = "jdbc:mariadb://200.200.200.223:3306/vsphere";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // DB 연결
        Class.forName("org.mardiadb.jdbc.Driver");
        conn = DriverManager.getConnection(db_url, db_username, db_password);

        // 회원 닉네임 업데이트 쿼리 실행
        String sql = "UPDATE member SET nickname=? WHERE u_id=?";
        pstmt = conn.prepareStatement(strSQL);
        pstmt.setString(1, nick);
        pstmt.setString(2, (String) session.getAttribute("user_id"));
        int rowsAffected = pstmt.executeUpdate();

        // 업데이트 성공 시 세션에 닉네임 설정 및 페이지 이동
        if (rowsAffected > 0) {
            session.setAttribute("nickname", nick);
            response.sendRedirect("member_nick.jsp?ch=1");
        } else {
            response.sendRedirect("member_nick.jsp?ch=2");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

