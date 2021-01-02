<?php

namespace App\Models;

final class CarreiraModel {


    public static function getFields(): array{
        return [
            'empresa_id',
            'tempo_medio',
            'distancia',
            'inicio',
            'fim'
        ];
    }


}