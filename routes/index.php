<?php

use App\Controllers\ParagemController;
use App\Controllers\CarreiraController;
use App\Controllers\EmpresaController;
use App\Controllers\HorarioController;
use App\Controllers\CarreiraParagemController;

use function src\slimConfiguration;

$app = new \Slim\App(slimConfiguration());

$app->group('/paragem', function () use ($app){
    $app->get ('/', ParagemController::class . ':index');
    $app->get ('/{id}', ParagemController::class . ':show');
    $app->post('/', ParagemController::class . ':create');
    $app->put ('/{id}', ParagemController::class . ':update');
    $app->delete('/{id}', ParagemController::class . ':delete');
});

$app->group('/empresa', function () use ($app){
    $app->get ('/', EmpresaController::class . ':index');
    $app->get ('/{id}', EmpresaController::class . ':show');
    $app->post('/', EmpresaController::class . ':create');
    $app->put ('/{id}', EmpresaController::class . ':update');
    $app->delete('/{id}', EmpresaController::class . ':delete');
});

$app->group('/carreira', function () use ($app){
    $app->get ('/', CarreiraController::class . ':index');
    $app->get ('/{id}', CarreiraController::class . ':show');
    $app->post('/', CarreiraController::class . ':create');
    $app->put ('/{id}', CarreiraController::class . ':update');
    $app->delete('/{id}', CarreiraController::class . ':delete');
});

$app->group('/horario', function () use ($app){
    $app->get ('/', HorarioController::class . ':index');
    $app->get ('/{id}', HorarioController::class . ':show');
    $app->post('/', HorarioController::class . ':create');
    $app->put ('/{id}', HorarioController::class . ':update');
    $app->delete('/{id}', HorarioController::class . ':delete');
});

$app->group('/carreira-paragem', function () use ($app){
    $app->get ('/', CarreiraParagemController::class . ':index');
    $app->get ('/{id}', CarreiraParagemController::class . ':show');
    $app->post('/', CarreiraParagemController::class . ':create');
    $app->put ('/{id}', CarreiraParagemController::class . ':update');
    $app->delete('/{id}', CarreiraParagemController::class . ':delete');
});

$app->run();