<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', function () {
    return redirect()->to('swagger-ui.html');
    
});

$routes->options('(:any)', static function () {
    // Establecer los encabezados CORS
    $response = service('response');
    $response->setHeader('Access-Control-Allow-Origin', '*');
    $response->setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE,PATCH');
    $response->setHeader('Access-Control-Allow-Headers', 'Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
    $response->setHeader('Access-Control-Allow-Credentials', 'true');

    // Enviar una respuesta vacía con un estado 204 No Content
    return $response->setStatusCode(204)->setBody('');
});

$routes->group('api/v1', ['namespace' => 'App\Controllers', 'filter'=>'cors'], function ($routes) {



    // Autenticación
    $routes->post('auth/login', 'AuthController::login');
    $routes->post('auth/refresh', 'AuthController::refreshToken');
    $routes->post('auth/logout', 'AuthController::logout');

    // // Públicos
    $routes->get('productos', 'ProductoController::index');
    $routes->get('productos/(:num)', 'ProductoController::show/$1');

    $routes->get('usuarios', 'UsuarioController::index');
    $routes->get('categorias', 'CategoriaController::index');

    // Protegidos
    $routes->group('', ['filter' => 'jwt'], function ($routes) {
        // $routes->group('',  function ($routes) {
        $routes->resource('productos', ['controller' => 'ProductoController']);
        $routes->resource('usuarios', ['controller' => 'UsuarioController']);
        $routes->resource('categorias', ['controller' => 'CategoriaController']);

        $routes->get('auth/me', 'AuthController::me');
    });
});

$routes->get('documentation', function () {
    // return redirect()->to('/docs/swagger.yaml');
    return redirect()->to('swagger-ui.html');
});
