<!-- insertForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
	<!-- head 부분 -->
	<head> 
		<!-- 상단 title -->
		<title>닉네임</title>
		<!-- CSS Style 지정 -->
		<link rel="stylesheet" href="../style_contents.css" type="text/css">			
	</head>
	<body>
		<!-- 화면 상단 header 부분 -->
			<iframe src="../head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
		<!-- 화면 하단 body 부분 -->
		<div id="nick_contents" class="contents">	
		<?php 
			session_start(); 
			if(!$_SESSION['user_id']){
				echo "<script>
					alert('로그인 후 이용하세요!');
					location.replace('member_login.jsp')</script>";
				exit;
			}
			if(@$_GET['ch']==1)
				echo "<h5>성공적으로 변경되었습니다.</h5>";
			else if(@$_GET['ch']==2)
				echo "<h5>닉네임을 변경하지 못하였습니다.</h5>";
		?>
			
			<form action="member_nick_change.jsp">
				<table cellpadding="10" style="border: 0px;">
					<tr>
						<th>닉네임 : </th>
						<td><input type="text" name="nick" value=<?=$_SESSION['nickname']?>></td>
						<td colspan="2"><input type="submit" value="변경" class="btn_default btn_gray" ></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
