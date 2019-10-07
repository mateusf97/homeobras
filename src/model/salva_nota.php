<?php

  function salvaNota($data) {
    include '../model/conexao.php';
    $SQL = "UPDATE users SET nota = '" . $data['value'] . "' WHERE id = '" . $data['id'] . "';";
    $rs = mysqli_query($conexao, $SQL) or die("error criacao de usuario");
  }



?>