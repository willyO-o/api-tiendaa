<?php

namespace App\Controllers;

use App\Libraries\JwtHandler;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\I18n\Time;
use App\Models\AutorizacionTokenModel;

class AuthController extends ResourceController
{
    protected $jwt;

    protected AutorizacionTokenModel $autorizacionTokenModel;

    public function __construct()
    {
        $this->jwt = new JwtHandler();
        $this->autorizacionTokenModel = new AutorizacionTokenModel();
    }

    public function login()
    {
        $data = $this->request->getJSON(true);

        // Validar credenciales (ejemplo básico)
        $user = model('UsuarioModel')->where('email', $data['email'])->first();
        if ($user && password_verify($data['password'], $user['password'])) {

            $payload = [
                'id' => $user['id'],
                'iat' => now(),
                'exp' => Time::now()->addSeconds(60)->getTimestamp(),
            ];

            $accessToken = $this->jwt->generateToken($payload);

            $idInsert = $this->autorizacionTokenModel->insert([
                'token' => $accessToken,
                'usuario_id' => $user['id'],
                'expira_el' =>  Time::now()->addSeconds(60)->toDateTimeString(),
                'esta_activo' => 1,
                'tipo' => 'access',
            ]);

            if (!$idInsert) {
                return $this->fail('No se pudo generar el token de acceso');
            }

            $payload['exp'] = Time::now()->addHours(2)->getTimestamp(); // 7 días
            $refreshToken = $this->jwt->generateToken($payload);

            $idInsert = $this->autorizacionTokenModel->insert([
                'token' => $refreshToken,
                'usuario_id' => $user['id'],
                'expira_el' => Time::now()->addHours(2)->toDateTimeString(),
                'esta_activo' => 1,
                'tipo' => 'refresh',
            ]);

            if (!$idInsert) {
                return $this->fail('No se pudo generar el token de refresco');
            }

            return $this->respond([
                'access_token' => [
                    'token' => $accessToken,
                    'expires' => Time::now()->addSeconds(60)->getTimestamp(),
                    'expires_date' => Time::now()->addSeconds(60)->toDateTimeString(),
                ],
                'refresh_token' => [
                    'token' => $refreshToken,
                    'expires' => Time::now()->addHours(2)->getTimestamp(),
                    'expires_date' => Time::now()->addHours(2)->toDateTimeString(),
                ],
            ]);
        }

        return $this->failUnauthorized('Credenciales inválidas');
    }

    public function refreshToken()
    {

        $data = $this->request->getJSON(true);

        $refreshToken = $data['refresh_token'] ?? null;

        if (!$refreshToken) {
            return $this->failUnauthorized('Token de refresco no proporcionado');
        }

        $payload = $this->jwt->validateToken($refreshToken);

        if (!$payload) {
            return $this->failUnauthorized('Token de refresco inválido');
        }

        $token = $this->autorizacionTokenModel->where('token', $refreshToken)
            ->where('usuario_id', $payload->id)
            ->where('tipo', 'refresh')
            ->where('esta_activo', 1)
            ->where('expira_el >', Time::now()->toDateTimeString())
            ->first();

        if (!$token) {
            return $this->failUnauthorized('Token de refresco no encontrado');
        }

        $user = model('UsuarioModel')->find($token['usuario_id']);

        if (!$user) {
            return $this->failUnauthorized('Usuario no encontrado');
        }

        $accessToken = $this->jwt->generateToken([
            'id' => $user['id'],
            'iat' => now(),
            'exp' => Time::now()->addSeconds(60)->getTimestamp(),
        ]);


        $idInsert = $this->autorizacionTokenModel->insert([
            'token' => $accessToken,
            'usuario_id' => $user['id'],
            'expira_el' => Time::now()->addSeconds(60)->toDateTimeString(),
            'esta_activo' => 1,
            'tipo' => 'access',
        ]);

        if (!$idInsert) {
            return $this->fail('No se pudo generar el token de acceso');
        }

        return $this->respond([
            'access_token' => [
                'token' => $accessToken,
                'expires' => Time::now()->addSeconds(60)->getTimestamp(),
                'expires_date' => Time::now()->addSeconds(60)->toDateTimeString(),

            ]
        ]);
    }

    public function logout()
    {
        $data = $this->request->getJSON(true);

        $refresToken = $data['refresh_token'] ?? null;

        if (!$refresToken) {
            return $this->failUnauthorized('Token de refresco no proporcionado');
        }

        $payload = $this->jwt->validateToken($refresToken);

        if (!$payload) {
            return $this->failUnauthorized('Token de refresco inválido');
        }

        $token = $this->autorizacionTokenModel->where('token', $refresToken)
            ->where('usuario_id', $payload->id)
            ->where('tipo', 'refresh')
            ->where('esta_activo', 1)
            ->where('expira_el >', Time::now()->toDateTimeString())
            ->first();

        if (!$token) {
            return $this->failUnauthorized('Token de refresco no encontrado');
        }

        $this->autorizacionTokenModel->update($token['id'], ['esta_activo' => 0]);

        return $this->respondDeleted('Sesión cerrada');
    }

    public function me()
    {
        //extraer el token de la cabecera de autorización

        $userId= $this->request->getHeaderLine('user_id');

        $user = model('UsuarioModel')->find($userId);

        if (!$user) {
            return $this->failNotFound('Usuario no encontrado');
        }

        unset($user['password']);

        return $this->respond($user);

        
    }
}
