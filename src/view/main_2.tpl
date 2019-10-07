<div class="row text-center top-space">
  <div class="columns small-12 top-space">
    Bem-vindo <?php echo $user['name']; ?><br>
    Aqui estão suas opções como Professor.<br>
    Estes são seus alunos, clique no nome para ver informações, ou lance a nota digita no campo à direita:
  </div>
</div>

<div class="row text-center top-space">
  <div class="columns small-12 top-space title-container">
    <div class="input-data-title">
      <b>Nome do aluno</b>
    </div>
    <div class="input-data-title">
      <b>Ver trabalho</b>
    </div><div class="input-data-title">
      <b>Nota do aluno</b>
    </div><div class="input-data-title">
      <b>Salvar nota</b>
    </div>
  </div>
  <?php foreach ($users as $key => $user): ?>
  <div class="columns small-12 top-space">
    <div class="input-data-user">
      <a href="?page=ver_aluno&id=<?php echo $user['id']; ?>"><?php  echo $user['name']; ?></a>
    </div>
    <div class="input-data-user">
      trabalho
    </div>
    <div class="input-data-user user-value" data-id="<?php echo $user['id']; ?>">
      <div class="input-data-container-small">
        <input autcomplete="off" class="input-data" value="<?php echo $user['nota']; ?>" type="text" id="value-<?php echo $user['id']; ?>">
      </div>
    </div>
    <div class="input-data-user">
      <div class="input-data-container-small">
        <input autcomplete="off" value="OK" class="input-data save" type="button" data-id="<?php echo $user['id']; ?>">
      </div>
    </div>
  </div>
  <?php endforeach ?>
</div>

<script type="text/javascript">
  var type = 1;

  $('.save').on('click',function(){
    var id = $(this).data('id');
    var value = $('#value-' + id).val();

    $.ajax({
      url: '/controller/salva_nota.php',
      dataType: 'json',
      data:{'id':id, 'value':value},
      type: 'POST',
      success: function(json) {
        if(json.success) {
          alert('Nota Salva');
        }
      }
    });
  });
</script>
