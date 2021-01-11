<?php

namespace App\DAO;

class CarreiraDAO extends Connection {

    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(){

        $data = array();

        

        foreach($this->db->carreira() as $carreira) {
            $paragens = array();

            foreach($this->db->carreiraparagem()->where('carreira_id',$carreira['id']) as $carreiraparagem) {
                $horarios = array();

                foreach($this->db->horario()->where('carreiraparagem_id', $carreiraparagem['id']) as $horario){
                    array_push($horarios, $horario['hora'] . ':' . (strlen($horario['minutos']) == 1 ? '0' . $horario['minutos'] : $horario['minutos']));
                }

                $paragem = $this->db->paragem[$carreiraparagem['paragem_id']];
                array_push($paragens,[
                    "id"=>  $paragem['id'],
                    "longitude" => $paragem['longitude'],
                    "latitude" => $paragem['latitude'],
                    "rua" =>  $paragem['rua'],
                    "cidade" => $paragem['cidade'],
                    "cod_postal" => $paragem['cod_postal'],
                    "horarios" => $horarios
                ]);
            }

            array_push($data,[
                'id' => $carreira['id'],
                'empresa' => $this->db->empresa[$carreira['empresa_id']]['nome'],
                'tempo_medio' => $carreira['tempo_medio'],
                'distancia' => $carreira['distancia'],
                'inicio' => $carreira['inicio'],
                'fim' => $carreira['fim'],
                'paragens' => $paragens
            ]);
        }

        
        return $data;
    }

    public function get($id){
        
        $data = array();

        

        foreach($this->db->carreira()->where('id',$id) as $carreira) {
            $paragens = array();

            foreach($this->db->carreiraparagem()->where('carreira_id',$carreira['id']) as $carreiraparagem) {
                    $horarios = array();

                    foreach($this->db->horario()->where('carreiraparagem_id', $carreiraparagem['id']) as $horario){
                        array_push($horarios, $horario['hora'] . ':' . (strlen($horario['minutos']) == 0 ? '0' . $horario['minutos'] : $horario['minutos']));
                    }

                    $paragem = $this->db->paragem[$carreiraparagem['paragem_id']];
                    array_push($paragens,[
                        "id"=>  $paragem['id'],
                        "longitude" => $paragem['longitude'],
                        "latitude" => $paragem['latitude'],
                        "rua" =>  $paragem['rua'],
                        "cidade" => $paragem['cidade'],
                        "cod_postal" => $paragem['cod_postal'],
                        "horarios" => $horarios
                    ]);
                }

            $data = [
                'id' => $carreira['id'],
                'empresa' => $this->db->empresa[$carreira['empresa_id']]['nome'],
                'tempo_medio' => $carreira['tempo_medio'],
                'distancia' => $carreira['distancia'],
                'inicio' => $carreira['inicio'],
                'fim' => $carreira['fim'],
                'paragens' => $paragens
            ];
        }

        
        return $data;
    }

    public function insert($carreira){
        $id = $this->db->carreira()->insert($carreira);

        if($id) return $this->db->carreira[$id];
        return false;
    }

    public function update($carreira){
        $id = $carreira['id'];

        $sucess = $this->db->carreira()->where('id',$id)->update($carreira);
        
        return $sucess;
    }
    
    public function delete($id){
        $sucess = $this->db->carreira()->where('id',$id)->delete();
        
        return $sucess;
    }
}