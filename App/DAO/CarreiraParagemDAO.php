<?php

namespace App\DAO;

class CarreiraParagemDAO extends Connection {

    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(){

        $data = array();

        foreach($this->db->carreiraparagem() as $carreiraparagem) {
            array_push($data,$carreiraparagem);
        }
        return $data;
    }

    public function get($id){
        $carreiraparagem =  $this->db->carreiraparagem[$id];
        return $carreiraparagem;
    }

    public function insert($carreiraparagem){
        $id = $this->db->carreiraparagem()->insert($carreiraparagem);

        if($id) return $this->db->carreiraparagem[$id];
        return false;
    }

    public function update($carreiraparagem){
        $id = $carreiraparagem['id'];

        $sucess = $this->db->carreiraparagem()->where('id',$id)->update($carreiraparagem);
        
        return $sucess;
    }
    
    public function delete($id){
        $sucess = $this->db->carreiraparagem()->where('id',$id)->delete();
        
        return $sucess;
    }
}