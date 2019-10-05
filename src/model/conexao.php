<?php

	$ip = "localhost";
	$user = "root";
	$senha = "";

	$db = "mysql";

	$conexao = mysqli_connect($ip,$user,$senha,$db);

	if (mysqli_connect_errno())
		echo "Erro na conexão: ".mysqli_connect_error();

?>


