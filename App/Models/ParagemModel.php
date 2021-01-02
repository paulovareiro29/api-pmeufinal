<?php

namespace App\Models;

final class ParagemModel {


    public static function getFields(): array{
        return [
            'latitude',
            'longitude',
            'rua',
            'cidade',
            'cod_postal'
        ];
    }


}