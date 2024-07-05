<?php

	$r_num = @$_GET['num'];
	$r_pass = @$_POST['b_pass'];

	require("../dbconn.php");
	
	$strSQL="select strNumber,strPassword,filename from board where strNumber=$r_num and strPassword='$r_pass'";

	$rs = mysqli_query($conn, $strSQL);
	$rs_arr = mysqli_fetch_array($rs);

	if($rs_arr){
		if(is_file("upload/$rs_arr[filename]")){		
			unlink("upload/$rs_arr[filename]");
		}
		$strSQL="delete from board where strNumber=$r_num";
		$rs = mysqli_query($conn, $strSQL);
		if($rs){
			echo "<script>alert('게시물이 삭제 되었습니다.');
			location.replace('board_list.php');</script>";
		}
	}else{
		echo "<script>alert('게시물을 삭제 할 수 없습니다.');
			history.back();</script>";
	}
?>
