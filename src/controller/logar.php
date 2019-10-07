<?php

	require_once '../model/logar.php';

  $user = $_REQUEST;

 $response['success'] = false;
 $response['error'] = true;


 $login = login($user);


  if ($login) {
    $response['success'] = true;
    $response['error'] = false;
    session_start();
    $_SESSION['user_id'] = $login;
  }

  print_r(json_encode($response));
?>

