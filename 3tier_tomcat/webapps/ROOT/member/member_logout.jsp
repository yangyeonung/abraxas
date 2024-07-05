<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
<%
    String userId = (String) session.getAttribute("user_id");
    if (userId != null && !userId.isEmpty()) {
        // 세션 무효화
        session.invalidate();
%>
        <script>
            alert('로그아웃 되었습니다.');
            location.replace('member_login.jsp');
        </script>
<%
    } else {
%>
        <script>
            alert('로그인 상태가 아닙니다.');
            history.back();
        </script>
<%
    }
%>
</body>
</html>

