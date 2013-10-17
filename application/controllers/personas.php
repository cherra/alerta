<?php

/**
 * Description of ciudadanos
 *
 * @author cherra
 */
class Personas extends CI_Controller {
    
    private $folder = '';
    private $clase = 'personas/';
    
    function __construct() {
        parent::__construct();
    }
    
    public function lista( $offset = 0 ){
        $this->load->model('persona','p');
        
        $this->config->load("pagination");
    	
        $data['titulo'] = 'Ciudadanos <small>Lista</small>';
    	$data['link_add'] = $this->folder.$this->clase.'agregar';
    	$data['action'] = $this->folder.$this->clase.'listado';
        
        // Filtro de busqueda (se almacenan en la sesión a través de un hook)
        $filtro = $this->session->userdata('filtro');
        if($filtro)
            $data['filtro'] = $filtro;
        
        $page_limit = $this->config->item("per_page");
    	$datos = $this->p->get_paged_list($page_limit, $offset, $filtro)->result();
    	
        // generar paginacion
    	$this->load->library('pagination');
    	$config['base_url'] = site_url($this->folder.$this->clase.'listado');
    	$config['total_rows'] = $this->p->count_all($filtro);
    	$config['per_page'] = $page_limit;
    	$config['uri_segment'] = 4;
    	$this->pagination->initialize($config);
    	$data['pagination'] = $this->pagination->create_links();
    	
    	// generar tabla
    	$this->load->library('table');
    	$this->table->set_empty('&nbsp;');
    	$tmpl = array ( 'table_open' => '<table class="' . $this->config->item('tabla_css') . '" >' );
    	$this->table->set_template($tmpl);
    	$this->table->set_heading('Nombre', 'Apellidos', 'Ciudad', 'Celular', 'Email', '');
    	foreach ($datos as $d) {
            $this->table->add_row(
                    $d->nombre,
                    $d->apellido_paterno.' '.$d->apellido_materno,
                    $d->municipio,
                    $d->celular,
                    $d->email,
                    anchor($this->folder.$this->clase.'push/' . $d->id, 'Push')
            );
    	}
    	$data['table'] = $this->table->generate();
    	// Cargar vista
    	$this->load->view('lista', $data);
    }
    
    public function push($id_persona) {
        $this->load->model('persona','p');
        
    	$data['titulo'] = 'Personas <small>Enviar push notification</small>';
    	$data['link_back'] = $this->folder.$this->clase.'lista';
    
    	$data['action'] = $this->folder.$this->clase.'push';
        $persona = $this->p->get_by_id($id_persona)->row();
        if($persona){
    	//if ( ($datos = $this->input->post()) ) {
            $this->load->library('apn');
            if( ($this->apn->push($persona->apn_token, 'chat', 'Push de prueba', '1')) ){
                $this->session->set_flashdata('mensaje',$this->config->item('create_success'));
                redirect($this->folder.$this->clase.'lista');
            }else{
                $this->session->set_flashdata('mensaje',$this->config->item('error'));
                redirect($this->folder.$this->clase.'lista');
            }
    		//$data['mensaje'] = '<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>¡Registro exitoso!</div>';
    	}
        
        echo "Pruebas";
        //$this->load->view('catalogos/productos/formulario', $data);
    }
}
?>
