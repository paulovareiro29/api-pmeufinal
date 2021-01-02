<?php

namespace App\DAO;

class HorarioDAO extends Connection {

    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(){

        $data = array();

        foreach($this->db->horario() as $horario) {
            array_push($data,[
                'id' => $horario['id'],
                'carreiraparagem_id' => $horario['carreiraparagem_id'],
                'hora' => $horario['hora'],
                'minutos' => (strlen($horario['minutos']) == 1 ? '0' . $horario['minutos'] : $horario['minutos'])
            ]);
        }
        return $data;
    }

    public function get($id){
        $horario =  $this->db->horario[$id];
        return [
            'id' => $horario['id'],
            'carreiraparagem_id' => $horario['carreiraparagem_id'],
            'hora' => $horario['hora'],
            'minutos' => (strlen($horario['minutos']) == 1 ? '0' . $horario['minutos'] : $horario['minutos'])
        ];
    }

    public function insert($horario){
        $id = $this->db->horario()->insert($horario);

        if($id) return $this->db->horario[$id];
        return false;
    }

    public function update($horario){
        $id = $horario['id'];

        $sucess = $this->db->horario()->where('id',$id)->update($horario);
        
        return $sucess;
    }
    
    public function delete($id){
        $sucess = $this->db->horario()->where('id',$id)->delete();
        
        return $sucess;
    }
}