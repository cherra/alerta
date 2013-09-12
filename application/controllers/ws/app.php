<?php

/**
 * Web Service para manejar las conexiones con la App móvil
 *
 * @author cherra
 */
class App extends CI_Controller {
    
    private $folder = 'ws/';
    private $clase = 'app/';
    
    function __construct() {
        parent::__construct();
    }
    
    public function insert_reporte(){
        if( ($reporte = $this->input->get()) ){
            $this->load->model('reporte','r');
            $this->load->library('uuid');
            $datos['id'] = $this->uuid->v4();
            $datos['id_persona'] = $reporte['id_persona'];
            $datos['mensaje'] = $reporte['mensaje'];
            //$datos['id_persona'] = $reporte['id_persona'];
            if( $this->r->save($datos) ){
                $resultado['id'] = $datos['id'];
                $resultado['mensaje'] = "ok";
            }else{
                $resultado['mensaje'] = 'error';
            }
            if(isset($reporte['callback'])){
                $this->output->set_content_type('text/javascript')->set_output($reporte['callback'].'('.json_encode($resultado, JSON_FORCE_OBJECT).')');
            }else{
                echo json_encode($resultado, JSON_FORCE_OBJECT);
            }
        }else{
            return json_encode(false);
        }
    }
    
    public function login(){
        $this->load->model('persona','p');
        if( ($datos = $this->input->get()) ){
            $login = $this->p->valida($datos['email'], $datos['password'])->row();
            if( $login ){
                $resultado['validacion'] = 'ok';
                $resultado['mensaje'] = 'Bien';
                $resultado['hora'] = date_create();
                //$resultado['token'] = $login->token;
                $resultado['telefono'] = $login->telefono;
                $resultado['generador'] = "Matica";
                $resultado['id_persona'] = $login->id;
            }else{
                $resultado['validacion'] = 'error';
                $resultado['mensaje'] = 'Datos incorrectos';
            }
            if(isset($datos['callback'])){
                $this->output->set_content_type('text/javascript')->set_output($datos['callback'].'('.json_encode($resultado, JSON_FORCE_OBJECT).')');
            }else{
                echo json_encode($resultado, JSON_FORCE_OBJECT);
            }
        }else
            echo json_encode(false);
    }
}
?>
