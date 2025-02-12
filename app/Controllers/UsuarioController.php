<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

class UsuarioController extends ResourceController
{
    protected $modelName = 'App\Models\UsuarioModel';

    // Endpoint público para listar usuarios con búsqueda, paginación y metadatos
    public function index()
    {
        $page = $this->request->getVar('page') ?? 1;
        $limit = $this->request->getVar('limit') ?? 10;
        $search = $this->request->getVar('search');

        $builder = $this->model->builder();
        if ($search) {
            $builder->like('email', $search);
        }

        $total = $builder->countAllResults(false);
        $usuarios = $builder->get($limit, ($page - 1) * $limit)->getResult();

        return $this->respond([
            'total' => $total,
            'page' => $page,
            'limit' => $limit,
            'data' => $usuarios,
        ]);
    }

    // Endpoint protegido para ver detalles de un usuario
    public function show($id = null)
    {
        $usuario = $this->model->find($id);
        if (!$usuario) {
            return $this->failNotFound('Usuario no encontrado');
        }

        return $this->respond($usuario);
    }

    // Endpoint protegido para crear un nuevo usuario
    public function create()
    {
        $data = $this->request->getJSON(true);

        // Validar datos
        if (!isset($data['email']) || !isset($data['password'])) {
            return $this->failValidationErrors('Datos incompletos');
        }

        // Encriptar contraseña
        $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);

        $this->model->insert($data);

        return $this->respondCreated([
            'message' => 'Usuario creado',
            'data' => $this->model->find($this->model->getInsertID()),
        ]);
    }

    // Endpoint protegido para actualizar un usuario
    public function update($id = null)
    {
        $data = $this->request->getJSON(true);


        if ($id == 1) {
            return $this->respondUpdated([
                'message' => 'No se puede modificar el usuario administrador',
                'data' => $this->model->find($id),
            ]);
        }

        // Validar datos
        // if (!isset($data['email']) && !isset($data['password']) && !isset($data['estado']) && !isset($data['avatar'])) {
        //     return $this->failValidationErrors('Datos incompletos');
        // }

        $usuario = $this->model->find($id);
        if (!$usuario) {
            return $this->failNotFound('Usuario no encontrado');
        }

        // Si se actualiza la contraseña, encriptarla
        if (isset($data['password'])) {
            $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        }

        $this->model->update($id, $data);

        return $this->respondUpdated([
            'message' => 'Usuario actualizado',
            'data' => $this->model->find($id),
        ]);
    }

    // Endpoint protegido para eliminar un usuario
    public function delete($id = null)
    {
        $usuario = $this->model->find($id);

        if ($id == 1) {
            return $this->respondDeleted([
                'message' => 'No se puede eliminar el usuario administrador',
                'data' => $this->model->find($id),
            ]);
        }

        if (!$usuario) {
            return $this->failNotFound('Usuario no encontrado');
        }

        $this->model->delete($id);

        return $this->respondDeleted(['message' => 'Usuario eliminado']);
    }
}
