<?php

namespace App\DAO;

class ParagemDAO extends Connection {

    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(){

        $data = array();

        foreach($this->db->paragem() as $paragem) {
            array_push($data,$paragem);
        }
        return $data;
    }

    public function get($id){
        $paragem =  $this->db->paragem[$id];
        return $paragem;
    }

    public function insert($paragem){
        $id = $this->db->paragem()->insert($paragem);

        if($id) return $this->db->paragem[$id];
        return false;
    }

    public function update($paragem){
        $id = $paragem['id'];

        $sucess = $this->db->paragem()->where('id',$id)->update($paragem);
        
        return $sucess;
    }
    
    public function delete($id){
        $sucess = $this->db->paragem()->where('id',$id)->delete();
        
        return $sucess;
    }
}