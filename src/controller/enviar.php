<?php

	require_once '../model/logar.php';

  $file = $_FILES['file'];

  $file_name = $file['name'];
  $temp_file = $file['tmp_name'];

  session_start();
  $user = $_SESSION['user_id'];

  $dir = "/tmp/files/" . $user . "/";

  if (!is_dir($dir)) {
    $oldumask = umask(0);
    mkdir($dir, 0777, true);
    umask($oldumask);
  }

  $name_data = explode('.', $file_name);
  $extension = "." . $name_data[count($name_data)-1];
  $pre_name = substr($name_data[0], 0, 128);

  $rand_id = (date('Y-m-d-H-i-s-')) . ((int) (rand()*1000));
  $file_name = $pre_name . $rand_id . $extension;
  $location = $dir . $file_name;

  if (!file_exists($location)) {
    move_uploaded_file($temp_file, $location);
  } else {
    unlink($location);
    move_uploaded_file($temp_file, $location);
  }

  salvarArquivo($_SESSION['user_id'], $location);

  $response['success'] = true;
  $response['error'] = false;

  print_r(json_encode($response));
?>

