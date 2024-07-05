<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="../style_contents.css" type="text/css">
</head>
<body>
    <iframe src="../head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
    <div id="board_contents" class="contents">
        <table width="600" border="1">
            <tr>
                <th colspan="5" style="background-color: #323232">
                    <font style="color: white; font-size: 150%;">게 시 판</font>
                </th>
            </tr>
            <tr bgcolor="#c8c8c8">
                <th width="7%"><font>번호</font></th>
                <th width="41%"><font>제목</font></th>
                <th width="15%"><font>작성자</font></th>
                <th width="30%"><font>등록일</font></th>
                <th width="7%"><font>조회</font></th>
            </tr>
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.naming.*, javax.sql.*" %>
            <%
                String strKeyword = request.getParameter("keyword");
                String strKeySelect = request.getParameter("k_s");
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    // 오라클 데이터베이스 연결
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    String dbURL = "jdbc:oracle:thin:@localhost:1521:source"; // Oracle DB URL
                    String dbUsername = "abraxas"; // 데이터베이스 사용자 이름
                    String dbPassword = "2076063678"; // 데이터베이스 비밀번호
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                    // 키워드 조회
                    String strSQL = "SELECT * FROM board";
                    if (strKeyword != null && !strKeyword.isEmpty()) {
                        switch (strKeySelect) {
                            case "1":
                                strSQL += " WHERE strSubject LIKE '%" + strKeyword + "%'";
                                break;
                            case "2":
                                strSQL += " WHERE strContent LIKE '%" + strKeyword + "%'";
                                break;
                            case "3":
                                strSQL += " WHERE strName LIKE '%" + strKeyword + "%'";
                                break;
                        }
                    }
                    strSQL += " ORDER BY strNumber DESC";
                    pstmt = conn.prepareStatement(strSQL);
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        do {
                            String b_num = rs.getString("strNumber");
                            String b_name = rs.getString("strName");
                            String b_sub = rs.getString("strSubject");
                            String b_no = rs.getString("viewCount");
                            String b_date = rs.getString("writeDate");
            %>
                            <tr>
                                <td width="7%"><font size="2"><%= b_num %></font></td>
                                <td width="41%"><font size="3"><a href="board_view.jsp?num=<%= b_num %>"><%= b_sub %></a></font></td>
                                <td width="15%"><font size="3"><%= b_name %></font></td>
                                <td width="30%"><font size="1"><%= b_date %></font></td>
                                <td width="7%"><font size="2"><%= b_no %></font></td>
                            </tr>
            <%
                        } while (rs.next());
                    } else {
            %>
                        <tr>
                            <td colspan="5" class="center"><font><b>검색 결과가 없습니다.</b></font></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // 자원 해제
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>
        <br/>
        <p align="center">
            <% if (strKeyword != null && !strKeyword.isEmpty()) { %>
                <font size="2">[<%= strKeyword %>] 검색 결과입니다.</font>
            <% } else { %>
                <font size="2">전체 글 검색 결과입니다.</font>
            <% } %>
            <form action="board_list.jsp">
                <select name="k_s">
                    <option value="1">글제목</option>
                    <option value="2">글내용</option>
                    <option value="3">작성자</option>
                </select>
                <input type="text" name="keyword">
                <input type="submit" class="btn_default btn_gray" value="검색">
		<!-- 글쓰기 버튼 -->
            <a href="board_write.jsp" class="btn_default btn_gray"> 글쓰기</a>

            </form>
        </p>
    </div>
</body>
</html>

