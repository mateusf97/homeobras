<div class="row text-center top-space">
	<div class="columns small-12 top-space">
		Bem vindo ao cadastro inicial!
	</div>
</div>

<div class="row text-center top-space">
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual o seu nome? <input autcomplete="off" class="input-data" type="text" id="nome">
		</div>
	</div>
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual seu cargo?<select name="select" id="type">
				<option value="1" selected>Sou Aluno</option>
				<option value="2">Sou Professor</option>
				<option value="3">Sou Administrador</option>
			</select>
		</div>
	</div>
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual o seu login? <input autcomplete="off" class="input-data" type="text" id="login">
		</div>
	</div>
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual o sua senha? <input autcomplete="off" class="input-data" type="password" id="password">
		</div>
	</div>
	<div class="columns small-12 top-space">
		<div class="input-data-container">
			<input value="Confirmar" class="input-data" type="button" id="submit">
		</div>
	</div>
</div>

<script type="text/javascript">
	var type = 1;
	$("#type").change(function(){
		type = $(this).children("option:selected").val();
	});

	$('#submit').on('click',function(){
		var nome = $('#nome').val(),
		login = $('#login').val(),
		password = $('#password').val();


		if(nome.length < 3 || login.length < 3 || password.length < 3) {
			alert("Nome, login e password precisam ter pelo pelos 3 caracteres");
		} else {

			$.ajax({
				url: '/controller/cadastrar.php',
				dataType: 'json',
				data:{'nome':nome, 'login':login, 'password':password, 'type':type},
				type: 'POST',
		    success: function(json) {
		    	if(json.error_exists) {
		    		alert('usuário já existe');
		    	}

		    	if(json.error_valid) {
		    		alert('dados inválidos');
		    	}

		    	if(json.success) {
		    		alert('Sucesso');
		    	}
		    }
	  });
		}
	});
</script>
