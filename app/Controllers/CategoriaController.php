<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

class CategoriaController extends ResourceController
{
    protected $modelName = 'App\Models\CategoriaModel';
    public function index()
    {
        $page = $this->request->getVar('page') ?? 1;
        $limit = $this->request->getVar('limit') ?? 10;
        $search = $this->request->getVar('search');

        $builder = $this->model->builder();
        if ($search) {
            $builder->like('categoria', $search);
        }

        $total = $builder->countAllResults(false);
        $categorias = $builder->get($limit, ($page - 1) * $limit)->getResult();

        return $this->respond([
            'total' => $total,
            'page' => $page,
            'limit' => $limit,
            'data' => $categorias,
        ]);
    }

    // Endpoint protegido para ver detalles de una categoría
    public function show($id = null)
    {
        $categoria = $this->model->find($id);
        if (!$categoria) {
            return $this->failNotFound('Categoría no encontrada');
        }

        return $this->respond($categoria);
    }

    // Endpoint protegido para crear una nueva categoría
        /**
     * Create a new resource object, from "posted" parameters.
     *
     * @return ResponseInterface
     */
    public function create()
    {
        $data = $this->request->getJSON(true);

        // Validar datos
        if (!isset($data['categoria']) || !isset($data['estado'])) {
            return $this->failValidationErrors('Datos incompletos');
        }

        $this->model->insert($data);

        return $this->respondCreated([
            'message' => 'Categoría creada',
            'data' => $this->model->find($this->model->getInsertID()),
        ]);
    }

    // Endpoint protegido para actualizar una categoría
    public function update($id = null)
    {
        $data = $this->request->getJSON(true);

        // Validar datos
        if (!isset($data['categoria']) && !isset($data['estado'])) {
            return $this->failValidationErrors('Datos incompletos');
        }

        $categoria = $this->model->find($id);
        if (!$categoria) {
            return $this->failNotFound('Categoría no encontrada');
        }

        $this->model->update($id, $data);

        return $this->respondUpdated([
            'message' => 'Categoría actualizada',
            'data' => $this->model->find($id),
        ]);
    }

    // Endpoint protegido para eliminar una categoría
    public function delete($id = null)
    {
        $categoria = $this->model->find($id);
        if (!$categoria) {
            return $this->failNotFound('Categoría no encontrada');
        }

        $this->model->delete($id);

        return $this->respondDeleted(['message' => 'Categoría eliminada']);
    }
}
