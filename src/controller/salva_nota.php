<?php

	require_once '../model/salva_nota.php';

  $data = $_REQUEST;
  salvaNota($data);

  print_r(json_encode(array('sucess' => true)));
?>

