<?php
		//error_reporting(E_ALL);
		//ini_set("display_errors",1);

		session_start();
		$nick = @$_GET['nick'];
		if(!$nick){
			echo "<script>alert('닉네임을 입력하세요');
				history.back();</script>";
			exit;
		}
		require "../dbconn.php";

		//$strSQL = "update member set nickname='테스트' where u_id='test01'";
		$strSQL = "update member set nickname='".$nick."'". "where u_id='".$_SESSION['user_id']."'";
	
		$rs = mysqli_query($conn,$strSQL);


		if($rs){
			$_SESSION['nickname']=$nick;
			header("Location: member_nick.php?ch=1");
		}else{
			header("Location: member_nick.php?ch=2");
		}

?>
