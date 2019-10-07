<?php

  function getUser() {
    include 'model/conexao.php';

    session_start();

    $SQL = "SELECT * FROM users WHERE id = '" . $_SESSION['user_id'] ."'";

    $rs = mysqli_query($conexao, $SQL) or die("login_erro");
    $result = array();

    while ($row = mysqli_fetch_array($rs)) {
      $data[] = $row;
    }

    $result['num_rows'] = count($data);
    $result['row'] = isset($data[0]) ? $data[0] : array();
    $result['rows'] = $data;

    // Retorna quantidade de usuários com o login especificado

    return $result['row'];
  }

  function getUsers() {
    include 'model/conexao.php';

    session_start();

    $SQL = "SELECT * FROM users WHERE type = 1";

    $rs = mysqli_query($conexao, $SQL) or die("login_erro");
    $result = array();

    while ($row = mysqli_fetch_array($rs)) {
      $data[] = $row;
    }

    $result['num_rows'] = count($data);
    $result['row'] = isset($data[0]) ? $data[0] : array();
    $result['rows'] = $data;

    // Retorna quantidade de usuários com o login especificado

    return $result['rows'];
  }


?>