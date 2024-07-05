<?php
  $file_name = urldecode(@$_GET['filename']);
  $file_path = "./upload/$file_name";
  $file_size = filesize($file_path);

  header("Content-Type: application/x-octetstream");
  header("Content-Disposition: attachment; filename=".urlencode($file_name));
  header("Content-Transfer-Encoding: binary");
  header("Content-Length: $file_size");

  readfile($file_path);

 ?>
