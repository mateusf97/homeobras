<?php

	$ip = "localhost:8887";
	$user = "root";
	$senha = "";

	$db = "homeobras";

	$conexao = mysqli_connect($ip,$user,$senha,$db);

	if (mysqli_connect_errno())
		echo "Erro na conexão: ".mysqli_connect_error();

?>


