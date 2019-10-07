<div class="row text-center top-space">
	<div class="columns small-12 top-space">
		Bem-vindo <?php echo $user['name']; ?><br>
		Aqui você pode enviar seu trabalho e alterar seus dados
	</div>
</div>

<form method="post" enctype="multipart/form-data" action="../controller/upload.php">
  <div class="row text-center top-space">
  	<div class="columns small-12 medium-4 top-space">
  		<div class="input-data-container">
  			Trabalho anterior: <a href="file:/<?php echo $user['url']; ?>" target="_blank">Arquivo</a>
  		</div>
  	</div>
    <div class="columns small-12 medium-4 top-space">
      <div class="input-data-container">
        <input value="Confirmar" class="input-data" type="file" id="file">
      </div>
    </div>
    <div class="columns small-12 medium-4 top-space">
      <div class="input-data-container">
        <input value="Confirmar" class="input-data" type="button" id="submit">
      </div>
    </div>
  </div>
</form>


<script type="text/javascript">
  $('#submit').on('click',function(){

  var formdata = new FormData();
  formdata.append("file", $('#file')[0].files[0]);

  $.ajax({
    type: 'POST',
    url: '/controller/enviar.php',
    data: formdata,
    contentType: false,
    cache: false,
    processData:false,
    dataType: 'json',
    success: function(json) {
      if (json.success) {
        alert('enviado com sucesso!');
        window.location = window.location;
      }
    }
  });
});


</script>