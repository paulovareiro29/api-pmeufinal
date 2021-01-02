<?php

namespace App\Models;

final class EmpresaModel {


    public static function getFields(): array{
        return [
            'nome',
            'morada',
        ];
    }


}