<?php

namespace App\Models;

final class HorarioModel {

    public static function getFields(): array{
        return [
            'carreiraparagem_id',
            'hora',
            'minutos'
        ];
    }


}