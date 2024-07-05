<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MemberShip</title>
</head>
<body>
    <h2>Make account</h2>
    <form method="post" action="./join_Action.jsp">
        <h3>ID</h3>
        <div class="joinID">
            <input type="text" class="input" placeholder="ID" name="userID" maxlength="20" required>
        </div>
        <h3>Password</h3>
        <div class="joinPassword">
            <input type="password" class="input" placeholder="password" name="userPassword" maxlength="20" required>
        </div>
        <h3>Name</h3>
        <div class="joinName">
            <input type="text" class="input" placeholder="name" name="userName" maxlength="20" required>
        </div>
        <h3>userDate</h3>
        <div class="joinDate">
            <input type="date" class="input" placeholder="생년월일" name="userDate" required>
        </div>
        <h3>Gender</h3>
        <div class="joinGender">
            <input type="radio" name="userGender" value="M" title="gender" required> male
            <input type="radio" name="userGender" value="F" title="gender" required> female
        </div>
	<input type="submit" class="bt_join" value="Go">
    </form>
</body>
</html>

