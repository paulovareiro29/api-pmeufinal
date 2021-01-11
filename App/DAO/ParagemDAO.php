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
            $carreiras = array();

            foreach($this->db->carreiraparagem()->where('paragem_id',$paragem['id']) as $carreiraparagem) {
                $horarios = array();

                foreach($this->db->horario()->where('carreiraparagem_id', $carreiraparagem['id']) as $horario){
                    array_push($horarios, $horario['hora'] . ':' . (strlen($horario['minutos']) == 1 ? '0' . $horario['minutos'] : $horario['minutos']));
                }

                $carreira = $this->db->carreira[$carreiraparagem['carreira_id']];
                array_push($carreiras,[
                    "id"=>  $carreira['id'],
                    "empresa" => $this->db->empresa[$carreira['empresa_id']]['nome'],
                    "tempo_medio" => $carreira['tempo_medio'],
                    "distancia" =>  $carreira['distancia'],
                    "inicio" => $carreira['inicio'],
                    "fim" => $carreira['fim'],
                    "horarios" => $horarios
                ]);
            }
            
            array_push($data,[
                'id'=> $paragem['id'],
                'longitude' => $paragem['longitude'],
                'latitude' => $paragem['latitude'],
                'rua' => $paragem['rua'],
                'cidade' => $paragem['cidade'],
                'cod_postal' => $paragem['cod_postal'],
                'carreiras' => $carreiras
            ]);
        }
        return $data;
    }

    public function get($id){
        $paragem =  $this->db->paragem[$id];
        
        $data = array();
        $carreiras = array();

        foreach($this->db->carreiraparagem()->where('paragem_id',$paragem['id']) as $carreiraparagem) {
            $horarios = array();

            foreach($this->db->horario()->where('carreiraparagem_id', $carreiraparagem['id']) as $horario){
                array_push($horarios, $horario['hora'] . ':' . (strlen($horario['minutos']) == 1 ? '0' . $horario['minutos'] : $horario['minutos']));
            }

            $carreira = $this->db->carreira[$carreiraparagem['carreira_id']];
            array_push($carreiras,[
                "id"=>  $carreira['id'],
                "empresa" => $this->db->empresa[$carreira['empresa_id']]['nome'],
                "tempo_medio" => $carreira['tempo_medio'],
                "distancia" =>  $carreira['distancia'],
                "inicio" => $carreira['inicio'],
                "fim" => $carreira['fim'],
                "horarios" => $horarios
            ]);
        }
        
        array_push($data,[
            'id'=> $paragem['id'],
            'longitude' => $paragem['longitude'],
            'latitude' => $paragem['latitude'],
            'rua' => $paragem['rua'],
            'cidade' => $paragem['cidade'],
            'cod_postal' => $paragem['cod_postal'],
            'carreiras' => $carreiras
        ]);

        return $data;
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