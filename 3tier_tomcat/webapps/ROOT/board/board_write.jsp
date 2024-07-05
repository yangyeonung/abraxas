<!DOCTYPE html>
<html>
<!-- head 부분 -->
<head>
    <!-- 상단 title -->
    <title>Table</title>
    <!-- CSS Style 지정 -->
    <link rel="stylesheet" href="../style_contents.css" type="text/css">
    <script>
        function ck() {
            if (document.wform.name.value == "") {
                alert("write your name cleary");
                document.wform.name.focus();
                return false;
            }
            if (document.wform.pw.value == "") {
                alert("write your password cleary");
                document.wform.pw.focus();
                return false;
            }
            if (document.wform.sub.value == "") {
                alert("write title cleary.");
                document.wform.sub.focus();
                return false;
            }
            if (document.wform.cont.value == "") {
                alert("write information cleary.");
                document.wform.cont.focus();
                return false;
            }
            document.wform.submit();
        }
    </script>
</head>
<body>
<!-- 화면 상단 header 부분 -->
<iframe src="../head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
<!-- 화면 하단 body 부분 -->
<div id="board_contents" class="contents">
    <%-- 세션 확인 --%>
    <% 
        session = request.getSession();
        if (session.getAttribute("user_id") != null) {
    %>
    <form name="wform" method="post" action="board_write_ok.jsp" enctype="multipart/form-data">
        <table width="600" class="grayColor">
            <tr>
                <th colspan="5" style="background-color: #323232">
                    <font style="color: white; font-size: 150%;">T A B L E</font>
                </th>
            </tr>
            <tr>
                <th width="100"><font>N A M E</font></th>
                <td><input type="text" name="user_name" size="11" value=""></td>
            </tr>
            <tr>
                <th><font>PASSWORD</font></th>
                <td><input type="password" name="password" size="12"></td>
            </tr>
            <tr>
                <th><font>E-MAIL</font></th>
                <td colspan="3"><input type="text" name="email" size="40" value=""></td>
            </tr>

            <tr>
                <th><font>TITLE</font></th>
                <td colspan="3"><input type="text" name="title" size="40"></td>
            </tr>
            <tr>
                <th><font>set type HTML</font></th>
                <td colspan="3">
                    <input type="radio" name="tag" value="T" checked><font size="3">apply</font>
                    <input type="radio" name="tag" value="F"><font size="3">unapplied</font>
                </td>
            </tr>
            <tr>
                <th><font>detail</font></th>
                <td colspan="3" align="center"><textarea name="cont" cols="60" rows="10" style="border: 2px;"></textarea></td>
            </tr>
            <tr>
                <th><font>add file</font></th>
                <td colspan="3"><input type="file" name="att_file"><font size="2">&nbsp;&nbsp;(max:4MB)</font></td>
            </tr>
        </table>
    </form>

    <p align="center">
        <input type="button" value="GO" class="btn_default btn_gray" onclick='ck();'>
        <input type="reset" value="RESET" class="btn_default btn_gray">
        <input type="button" value="MENU" class="btn_default btn_gray" onclick="location.replace('board_list.jsp');">
    </p>
    <% } %>
</div>
</body>
</html>

