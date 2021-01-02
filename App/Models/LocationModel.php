<?php

namespace App\Models;

final class LocationModel {


    public static function getFields(): array{
        return [
            'latitude',
            'longitude',
            'descricao',
            'photo',
            'users_id'
        ];
    }


}