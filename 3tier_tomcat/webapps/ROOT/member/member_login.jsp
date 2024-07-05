<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!doctype html>
<html>
    <!-- head 부분 -->
    <head>
        <!-- 상단 title -->
        <title>로그인</title>
        <!-- CSS Style 지정 -->
        <link rel="stylesheet" href="../style_contents.css" type="text/css">
    </head>
    <body>
        <!-- 화면 상단 header 부분 -->
        <iframe src="../head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
        <!-- 화면 하단 body 부분 -->
        <div id="login_contents" class="contents">
            <%
                // 세션 확인
                String userId = (String) session.getAttribute("user_id");
                if (userId != null) {
                    // 이미 로그인된 상태
            %>
                    <script>
                        alert('이미 로그인 된 상태입니다.');
                        location.replace('../insertForm.jsp');
                    </script>
            <%
                } else {
                    // 로그인되지 않은 상태
            %>
                    <form method="post" action="member_login_check.jsp">
                        <table>
                            <tr>
                                <th colspan="2" style="background-color: #323232">
                                    <font style="color: white; font-size: 150%;">LOGIN</font>
                                </th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <td class="input"><input type="text" name="user_id" style="border: 0;" maxlength="12"></td>
                            </tr>
                            <tr>
                                <th>PASSWORD</th>
                                <td class="input"><input type="password" name="password" style="border: 0;" maxlength="20"></td>
                            </tr>
                        </table>
                        <p>
                            <input type="submit" value="로그인" class="btn_default btn_gray">
                        </p>
                    </form>
            <%
                }
            %>
        </div>
    </body>
</html>

