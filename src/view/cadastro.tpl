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
			Qual o seu CPF? <input autcomplete="off" class="input-data" type="text" id="CPF">
		</div>
	</div>
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual sua data de nascimento? <input autcomplete="off" class="input-data" type="text" id="date">
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

<a style="display: none;" href="?page=main" class="google-submit to-main full-size">Área do usuário</a>

<script type="text/javascript">
	var type = 1;
	$("#type").change(function(){
		type = $(this).children("option:selected").val();
	});

	$('#submit').on('click',function(){
		var nome = $('#nome').val(),
		login = $('#login').val(),
		password = $('#password').val();
		cpf = $('#CPF').val();
		date = $('#date').val();


		if(date.length != 10) {
			alert("Data de enscimento precisa ter o formato DD/MM/YYYY");
		}	else if(cpf.length != 11) {
			alert("CPF precisa ter 11 caracteres, sem espaços ou pontos, apenas números");
		} else if(nome.length < 3 || login.length < 3 || password.length < 3) {
			alert("Nome, login e password precisam ter pelo pelos 3 caracteres");
		} else {

			$.ajax({
				url: '/controller/cadastrar.php',
				dataType: 'json',
				data:{'nome':nome, 'login':login, 'cpf':cpf, 'password':password, 'date':date, 'type':type},
				type: 'POST',
		    success: function(json) {
		    	if(json.error_exists) {
		    		alert('usuário já existe');
		    	}

		    	if(json.error_valid) {
		    		alert('dados inválidos');
		    	}

		    	if(json.success) {
		    		alert('Usuário Cadastrado com sucesso');
		    		window.location = $('.to-main')[0].href;
		    	}
		    }
	  });
		}
	});
</script>
