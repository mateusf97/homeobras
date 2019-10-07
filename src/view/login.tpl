<div class="row text-center top-space">
	<div class="columns small-12 top-space">
		Bem vindo ao login!
	</div>
</div>

<div class="row text-center top-space">
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual o seu username? <input autcomplete="off" class="input-data" type="text" id="login">
		</div>
	</div>
	<div class="columns medium-6 small-12 top-space">
		<div class="input-data-container">
			Qual sua senha? <input autcomplete="off" class="input-data" type="password" id="password">
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

	$('#submit').on('click',function(){
		var login = $('#login').val(),
				password = $('#password').val();

			$.ajax({
				url: '/controller/logar.php',
				dataType: 'json',
				data:{'login':login, 'password':password},
				type: 'POST',
		    success: function(json) {
		    	if(json.error) {
		    		alert('Usuário ou senha inválidos');
		    	}

		    	if(json.success) {
		    		window.location = $('.to-main')[0].href;
		    	}
		    }
	  });
	});
</script>
