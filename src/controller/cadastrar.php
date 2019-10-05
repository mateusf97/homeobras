<?php

	require_once '../model/cadastrar.php';

  $user = $_REQUEST;

 $response['success'] = true;
 $response['error_valid'] = false;
 $response['error_exists'] = false;

	if (!validaDados($user)) {
   $response['success'] = false;
   $response['error_valid'] = true;
  }

  if (verificaDuplicata($user)) {
   $response['success'] = false;
   $response['error_exists'] = true;
  }

  if ($response['success']) {
    session_start();
    $_SESSION['user_id'] = criaUsuario($user);
  }

  print_r(json_encode($response));
?>

