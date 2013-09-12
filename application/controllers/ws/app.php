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
    
    public function get_categorias(){
        if( ($datos = $this->input->get()) ){
            $this->load->model('categoria','c');
            $categorias = $this->c->get_all();
            if($categorias->num_rows() > 0){
                $resultado = $categorias->result_array();
                if(isset($datos['callback'])){
                    $this->output->set_content_type('text/javascript')->set_output($datos['callback'].'('.json_encode($resultado, JSON_FORCE_OBJECT).')');
                }else{
                    echo json_encode($resultado, JSON_FORCE_OBJECT);
                }
            }else{
                return json_encode(false);
            }
        }
    }
    
    public function get_incidentes(){
        if( ($datos = $this->input->get()) ){
            $this->load->model('incidente','i');
            $incidentes = $this->i->get_menu_by_categoria($datos['id_categoria']);
            if($incidentes->num_rows() > 0){
                $resultado = $incidentes->result_array();
                if(isset($datos['callback'])){
                    $this->output->set_content_type('text/javascript')->set_output($datos['callback'].'('.json_encode($resultado, JSON_FORCE_OBJECT).')');
                }else{
                    echo json_encode($resultado, JSON_FORCE_OBJECT);
                }
            }else{
                if(isset($datos['callback'])){
                    $this->output->set_content_type('text/javascript')->set_output($datos['callback'].'('.json_encode(false).')');
                }else{
                    return json_encode(false);
                }
            }
        }else{
            echo json_encode(false);
        }
    }
    
    public function insert_reporte(){
        if( ($reporte = $this->input->get()) ){
            $this->load->model('reporte','r');
            $this->load->library('uuid');
            $datos['id'] = $this->uuid->v4();
            $datos['id_persona'] = $reporte['id_persona'];
            $datos['id_tipo'] = $reporte['id_tipo'];
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
