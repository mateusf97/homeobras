<?php

	include_once 'model/conexao.php';

	$SQL = "SELECT NOW() AS hora";
	$rs = mysqli_query($conexao, $SQL) or die("login_erro");
	$result = array();

  while ($row = mysqli_fetch_array($rs)) {
    $data[] = $row;
  }

  $result['num_rows'] = count($data);
  $result['row'] = isset($data[0]) ? $data[0] : array();
  $result['rows'] = $data;

  return $result;

?>