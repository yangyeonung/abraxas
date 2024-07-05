<!doctype html>
<html>
	<!-- head 부분 -->
	<head>
		<!-- 상단 title -->
		<title>게시판</title>
		<!-- CSS Style 지정 -->
		<link rel="stylesheet" href="../style_contents.css" type="text/css">
		<script>
			function ck(){
				if(document.wform.name.value == ""){
					alert("이름을 입력해 주세요.");
					document.wform.name.focus();
					return false;
				}
				if(document.wform.pw.value == ""){
					alert("비밀번호를 입력해 주세요.");
					document.wform.pw.focus();
					return false;
				}
				if(document.wform.sub.value == ""){
					alert("제목을 입력해 주세요.");
					document.wform.sub.focus();
					return false;
				}
				if(document.wform.cont.value == ""){
					alert("내용을 입력해 주세요.");
					document.wform.cont.focus();
					return false;
				}
				document.wform.submit();
			}
		</script>
	</head>
	<body>
		<!-- 화면 상단 header 부분 -->
		<iframe src="../head.php" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
		<!-- 화면 하단 body 부분 -->
		<div id="board_contents" class="contents">
			<?php
				session_start();
				if($_SESSION[user_id]){
					require "../dbconn.php";
					$strSQL="select u_name,email from member where u_id='$_SESSION[user_id]'";
					$rs = mysql_query($strSQL);
					$rs_arr = mysql_fetch_array($rs);
					$name = $rs_arr[u_name];
					$email = $rs_arr[email];
				}
			?>
			<form name="wform" method="post" action="board_write_ok.php" enctype="multipart/form-data">
				<table width="600" class="grayColor">
					<tr>
						<th colspan="5" style="background-color: #323232" >
							<font style="color: white; font-size: 150%;" >게 시 글 작 성</font>
						</th>
					</tr>
					<tr>
						<th width="100"><font>이  름</font></th>
						<td><input type="text" name="name" size="11" value="<?=$name;?>"></td>
					</tr>
					<tr>
						<th><font>비밀번호</font></th>
						<td><input type="password" name="pw" size="12"></td>
					</tr>
					<tr>
						<th><font>이메일</font></th>
						<td colspan="3"><input type="text" name="email" size="40" value="<?=$email;?>"></td>
					</tr>

					<tr>
						<th><font>제  목</font></th>
						<td colspan="3"><input type="text" name="sub" size="40"></td>
					</tr>
					<tr>
						<th><font>HTML적용</font></th>
						<td colspan="3">
							<input type="radio" name="tag" value="T" checked><font size="3">적용</font>
							<input type="radio" name="tag" value="F"><font size="3">비적용</font>
						</td>
					</tr>
					<tr>
						<th><font>내  용</font></th>
						<td colspan="3" align="center"><textarea name="cont" cols="60" rows="10" style="border: 0px;"></textarea></td>
					</tr>
					<tr>
						<th><font>파일첨부</font></th>
						<td colspan="3"><input type="file" name="att_file"><font size="2">&nbsp;&nbsp;(최대 4MB)</font></td>
					</tr>
				</table>
			</form>

			<p align="center">
				<input type="button" value="등록" class="btn_default btn_gray" onclick='ck();'>
				<input type="reset" value="다시작성" class="btn_default btn_gray" >
				<input type="button" value="목록" class="btn_default btn_gray" onclick="location.replace('board_list.php');">
			</p>
		</div>
	</body>
</html>
