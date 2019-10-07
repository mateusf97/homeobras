<?php

  function login($data) {
    include '../model/conexao.php';

    $SQL = "SELECT id FROM users WHERE login = '" . $data['login'] ."' AND password = '" . $data['password'] ."'";

    $rs = mysqli_query($conexao, $SQL) or die("login_erro");
    $result = array();

    while ($row = mysqli_fetch_array($rs)) {
      $data[] = $row;
    }

    $result['num_rows'] = count($data);
    $result['row'] = isset($data[0]) ? $data[0] : array();
    $result['rows'] = $data;

    if (isset($result['row']['id']) && $result['row']['id']) {
      return $result['row']['id'];
    } else {
      return false;
    }
  }

  function salvarArquivo($id, $url) {
    include '../model/conexao.php';

    $SQL = "UPDATE users SET url = '" . $url . "' WHERE id = '" . $id . "';";
    $rs = mysqli_query($conexao, $SQL) or die("error criacao de usuario");
  }

?>