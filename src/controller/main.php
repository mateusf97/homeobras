<?php

  require_once 'model/main.php';

  $user = getUser();

  if ((int)$user['type'] === (int)1) {
    // É aluno
  } elseif ((int)$user['type'] === (int)2) {
    // É professor

    $users = getUsers();

  } elseif ((int)$user['type'] === (int)3) {
    // É adminstrador
  }

  require_once 'view/main_' . (int) $user['type'] . '.tpl';

?>

