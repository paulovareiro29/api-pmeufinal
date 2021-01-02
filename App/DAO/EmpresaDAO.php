<?php

namespace App\DAO;

class EmpresaDAO extends Connection {

    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(){

        $data = array();

        foreach($this->db->empresa() as $empresa) {
            array_push($data,$empresa);
        }
        return $data;
    }

    public function get($id){
        $empresa =  $this->db->empresa[$id];
        return $empresa;
    }

    public function insert($empresa){
        $id = $this->db->empresa()->insert($empresa);

        if($id) return $this->db->empresa[$id];
        return false;
    }

    public function update($empresa){
        $id = $empresa['id'];

        $sucess = $this->db->empresa()->where('id',$id)->update($empresa);
        
        return $sucess;
    }
    
    public function delete($id){
        $sucess = $this->db->empresa()->where('id',$id)->delete();
        
        return $sucess;
    }
}