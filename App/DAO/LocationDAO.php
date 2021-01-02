<?php

namespace App\DAO;

class LocationDAO extends Connection {

    public function __construct()
    {
        parent::__construct();
    }

    public function getAll(){

        $data = array();

        foreach($this->db->locations() as $loc) {
            array_push($data,[
            'id' => $loc['id'],
            'latitude' => $loc['latitude'],
            'longitude' => $loc['longitude'],
            'descricao' => $loc['descricao'],
            'photo' => $loc['photo'],
            'user' => [
                'id' => $this->db->users[$loc['users_id']]['id'],
                'username' => $this->db->users[$loc['users_id']]['username'],
            ]
            ]);
        }
        return $data;
    }

    public function get($id){
        $loc =  $this->db->locations[$id];
        return "oi";
        return [
            'id' => $loc['id'],
            'latitude' => $loc['latitude'],
            'longitude' => $loc['longitude'],
            'descricao' => $loc['descricao'],
            'photo' => $loc['photo'],
            'user' => [
                'id' => $this->db->users[$loc['users_id']]['id'],
                'username' => $this->db->users[$loc['users_id']]['username'],
            ]];

    }

    public function insert($loc){
        $id = $this->db->locations()->insert($loc);

        if($id) return $this->db->locations['id'];
        return false;
    }

    public function update($loc){
        $id = $loc['id'];

        $sucess = $this->db->locations()->where('id',$id)->update($loc);
        
        return $sucess;
    }
    
    public function delete($id){
        $sucess = $this->db->locations()->where('id',$id)->delete();
        
        return $sucess;
    }
}