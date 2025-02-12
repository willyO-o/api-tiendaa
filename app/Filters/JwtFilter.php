<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

use App\Libraries\JwtHandler;

class JwtFilter implements FilterInterface
{

    protected $jwt;

    /**
     * Do whatever processing this filter needs to do.
     * By default it should not return anything during
     * normal execution. However, when an abnormal state
     * is found, it should return an instance of
     * CodeIgniter\HTTP\Response. If it does, script
     * execution will end and that Response will be
     * sent back to the client, allowing for error pages,
     * redirects, etc.
     *
     * @param RequestInterface $request
     * @param array|null       $arguments
     *
     * @return RequestInterface|ResponseInterface|string|void
     */
    public function before(RequestInterface $request, $arguments = null)
    {

        $this->jwt = new JwtHandler();

        $authHeader = $request->getServer('HTTP_AUTHORIZATION');
        if (!$authHeader || !preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
            return service('response')->setStatusCode(401)->setJSON(['error' => 'Token no proporcionado']);
        }

        $token = $matches[1];
        $decoded = $this->jwt->validateToken($token);
        if (!$decoded) {
            return service('response')->setStatusCode(401)->setJSON(['error' => 'Token inválido']);
        }

        //verificar el token en la base de datos
        $tokenModel = model('AutorizacionTokenModel');
        $tokenData = $tokenModel->where('token', $token)->where('esta_activo', 1)->where('tipo', 'access')->where('expira_el >', date('Y-m-d H:i:s',now()))->first();
        if (!$tokenData) {
            return service('response')->setStatusCode(401)->setJSON(['error' => 'Token no válido o expirado']);
        }

        //guardar el id del usuario en la solicitud

        $request->setHeader('user_id', $decoded->id);
        // return $next($request);

    }

    /**
     * Allows After filters to inspect and modify the response
     * object as needed. This method does not allow any way
     * to stop execution of other after filters, short of
     * throwing an Exception or Error.
     *
     * @param RequestInterface  $request
     * @param ResponseInterface $response
     * @param array|null        $arguments
     *
     * @return ResponseInterface|void
     */
    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        //
    }
}
