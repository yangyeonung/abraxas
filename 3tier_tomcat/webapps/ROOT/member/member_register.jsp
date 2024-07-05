<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.security.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <link rel="stylesheet" href="../style_contents.css" type="text/css">
    <script>
        function ck() {
            if (document.mform.user_id.value == "" || document.mform.user_id.value.length < 4 || document.mform.user_id.value.length > 12) {
                alert("아이디는 4자 이상 12자 이하로 입력하세요.");
                mform.user_id.focus();
                return false;
            }
            if (document.mform.user_id.value == "admin" || document.mform.user_id.value == "master" || document.mform.user_id.value == "root") {
                alert("해당 아이디는 사용할 수 없습니다.");
                mform.user_id.focus();
                return false;
            }
            if (document.mform.name.value == "") {
                alert("이름을 입력하세요.");
                mform.name.focus();
                return false;
            }
            if (document.mform.user_pw1.value == "" || document.mform.user_pw1.value.length < 6 || document.mform.user_pw1.value.length > 20) {
                alert("비밀번호는 6자 이상 20자 이하로 입력하세요.");
                mform.user_pw1.focus();
                return false;
            }
            if (document.mform.user_pw1.value != document.mform.user_pw2.value) {
                alert("입력한 비밀번호가 일치하지 않습니다.");
                mform.user_pw2.focus();
                return false;
            }
            document.mform.submit();
        }
    </script>
</head>
<body>
    <iframe src="../head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
    <div id="register_contents" class="contents">
        <form name="mform" method="post" action="member_register_ok.jsp">
            <table width="550" cellpadding="3" class="grayColor">
                <tr>
                    <th colspan="2" style="background-color: #323232">
                        <font style="color: white; font-size: 150%;">회원 등록</font>
                    </th>
                </tr>
                <tr>
                    <th width="120px"><font>*ID</font></th>
                    <td>
                        <input type="text" name="user_id" size="15" maxlength="12">
                        &nbsp;&nbsp;&nbsp;<font style="color:red;">4~12(영문/숫자)</font>
                    </td>
                </tr>
                <tr>
                    <th><font>*이름</font></th>
                    <td><input type="text" name="name" size="15" maxlength="10"></td>
                </tr>
                <tr>
                    <th><font>*비밀번호</font></th>
                    <td>
                        <input type="password" name="user_pw1" size="20" maxlength="20">
                        &nbsp;<font style="color:red;">6~20(영문/숫자/특수문자)</font>
                    </td>
                </tr>
                <tr>
                    <th><font>*비밀번호 확인</font></th>
                    <td><input type="password" name="user_pw2" size="20" maxlength="20"></td>
                </tr>
                <tr>
                    <th><font>나이</font></th>
                    <td><input type="number" name="age" size="30" min="0" max="150"></td>
                </tr>
                <tr>
                    <th><font>닉네임</font></th>
                    <td><input type="text" name="nick" size="30" maxlength="30"></td>
                </tr>
                <tr>
                    <th><font>EMAIL</font></th>
                    <td><input type="text" name="email" size="30" maxlength="30"></td>
                </tr>
            </table>
            <p>
                <font size=2>* 는 필수 입력 항목입니다.</font><br/><br/>
                <input type="button" value="등록" onclick="ck();" class="btn_default btn_gray">
                <input type="reset" value="삭제" class="btn_default btn_gray">
            </p>
        </form>
    </div>
</body>
</html>
