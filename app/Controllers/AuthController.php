<?php

namespace App\Controllers;

use App\Libraries\JwtHandler;
use CodeIgniter\RESTful\ResourceController;

class AuthController extends ResourceController
{
    protected $jwt;

    public function __construct()
    {
        $this->jwt = new JwtHandler();
    }

    public function login()
    {
        $data = $this->request->getJSON(true);

        // Validar credenciales (ejemplo básico)
        $user = model('UsuarioModel')->where('email', $data['email'])->first();
        if ($user && password_verify($data['password'], $user['password'])) {
            $payload = ['id' => $user['id'], 'email' => $user['email']];
            $accessToken = $this->jwt->generateToken($payload);
            $refreshToken = $this->jwt->generateToken(['id' => $user['id']]);

            return $this->respond([
                'access_token' => $accessToken,
                'refresh_token' => $refreshToken,
            ]);
        }

        return $this->failUnauthorized('Credenciales inválidas');
    }
}