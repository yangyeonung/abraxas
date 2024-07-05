<!-- insertForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
	<!-- head 부분 -->
	<head> 
		<!-- 상단 title -->
		<title>Web Test Site</title>
		<!-- CSS Style 지정 -->
		<link rel="stylesheet" href="style_contents.css" type="text/css">
	</head>
	<body>
		<!-- 화면 상단 header 부분 -->
			<iframe src="./head.jsp" id="bodyFrame" name="body" width="100%" frameborder="0"></iframe>
		<!-- 화면 하단 body 부분 -->
		<div id="main_contents" class="contents">
			<h1>
			<?php 
			 	//에러 확인용
                error_reporting(E_ALL);
                ini_set("display_errors",1);
				
				
				session_start();
				if (isset($_SESSION['nickname'])) {
					$nick = $_SESSION['nickname'];
					echo $nick."님 ";
				  } 		
			?>Welcome to Maria DB Test Site</h1>
			<font color="#323232" size="4em">
			IAC Final Project <br>
			vSphere Cloud DataCenter <br>
			3Tier Service Part<br>
			<br>
			</font>
		</div>
	</body>
</html>
