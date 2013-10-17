<?php
/**
 * Description of apn
 *
 * @author cherra
 */
class Apn {
    
    var $ci;
    var $ctx, $fp;
    
    function __construct() {
        $this->ci = &get_instance();
    }
    
    private function abrir_socket(){
        $passphrase = 'cherra3003';
        
        $this->ctx = stream_context_create();
        stream_context_set_option($this->ctx, 'ssl', 'local_cert', 'apns-dist.pem');
        stream_context_set_option($this->ctx, 'ssl', 'passphrase', $passphrase);

        // Open a connection to the APNS server
        $this->fp = stream_socket_client(
                'ssl://gateway.push.apple.com:2195', $err,
                $errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $this->ctx);

        if ($this->fp)
            return true;
        else
            return false;
    }
    
    private function cerrar_socket(){
        if($this->fp)
            fclose($this->fp);
    }
    
    function push($token, $tipo, $alerta, $badge, $sonido = 'default'){
        if($this->abrir_socket()){
            $body['aps'] = array(
                'alert' => $alerta,
                'sound' => $sonido,
                'badge' => $badge
            );
            $body['tipo'] = $tipo;

            $payload = json_encode($body);
            $msg = chr(0) . pack('n', 32) . pack('H*', $token) . pack('n', strlen($payload)) . $payload;

            $result = fwrite($this->fp, $msg, strlen($msg));
            $this->cerrar_socket();
            if($result)
                return true;
            else
                return false;
        }
    }
}

?>
