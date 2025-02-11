<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');


$routes->group('api/v1', ['namespace' => 'App\Controllers'], function ($routes) {
    // Autenticación
    $routes->post('auth/login', 'AuthController::login');

    // // Públicos
    $routes->get('productos', 'ProductoController::index');
    $routes->get('usuarios', 'UsuarioController::index');
    $routes->get('categorias', 'CategoriaController::index');

    // Protegidos
    // $routes->group('', ['filter' => 'jwt'], function ($routes) {
    // $routes->group('',  function ($routes) {
        $routes->resource('productos',['controller' => 'ProductoController']);
        $routes->resource('usuarios',['controller' => 'UsuarioController']);
        $routes->resource('categorias',['controller' => 'CategoriaController']);
    // });
});

$routes->get('documentation', function () {
    // return redirect()->to('/docs/swagger.yaml');
    return redirect()->to('swagger-ui.html');
});