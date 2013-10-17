<div class="page-header">
    <h2><?php echo $titulo; ?></h2>
</div>
<?php echo form_open($action, array('class' => 'form-inline', 'name' => 'form', 'id' => 'form', 'role' => 'form')) ?>
    <div class="form-group">
        <label class="sr-only" for="filtro">Filtros</label>
        <input type="text" class="form-control" name="filtro" id="filtro" placeholder="Filtros de busqueda" value="<?php if(isset($filtro)) echo $filtro; ?>" >
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Buscar</button>
    </div>
<?php echo form_close(); ?>
<div class="row">
    <div class="col-xs-12 col-sm-9 col-md-10">
        <?php echo $pagination; ?>
    </div>
    <div class="col-xs-12 col-sm-3 col-md-2">
        <p class="text-right"><?php echo anchor($link_add,'<span class="glyphicon glyphicon-plus"></span> Nuevo', array('class' => 'btn btn-default btn-block')); ?></p>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div><?php echo $table; ?></div>
    </div>
</div>
<div class="modal fade" id="pushModal">
  <div class="modal-dialog">
    <div class="modal-content">
        <?php echo form_open($action_push, array('class' => 'form-horizontal', 'name' => 'formPush', 'id' => 'formPush', 'role' => 'form')) ?>
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">Escribe el mensaje</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" name="id_persona" id="id_persona" />
                    <textarea name="mensaje" id="mensaje" rows="5" placeholder="Escribe un mensaje"></textarea>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <button type="submit" class="btn btn-primary" id="btnenviar">Enviar</button>
      <!--        <button type="button" id="btnenviar" class="btn btn-primary">Enviar</button>-->
            </div>
        <?php echo form_close(); ?>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
$(document).ready(function(){
    $('#filtro').focus();
    
    $('table').on('click', 'a', function(){
        $('#id_persona').val($(this).attr('id_persona'));
    });
});
</script>