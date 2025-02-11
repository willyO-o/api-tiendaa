<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;

class ProductoController extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format.
     *
     * @return ResponseInterface
     */

     protected $modelName = 'App\Models\ProductoModel';

    public function index()
    {
        $page = $this->request->getVar('page') ?? 1;
        $limit = $this->request->getVar('limit') ?? 10;
        $search = $this->request->getVar('search');

        $builder = $this->model->builder();
        $builder->join('categorias c', 'c.id = productos.categoria_id');

        if ($search) {
            $builder->like('titulo', $search)->orLike('descripcion', $search);
        }

        $total = $builder->countAllResults(false);
        $productos = $builder->get($limit, ($page - 1) * $limit)->getResult();

        return $this->respond([
            'total' => $total,
            'page' => $page,
            'limit' => $limit,
            'data' => $productos,
        ]);
    }

    /**
     * Return the properties of a resource object.
     *
     * @param int|string|null $id
     *
     * @return ResponseInterface
     */
    public function show($id = null)
    {
        $producto = $this->model->find($id);
        if (!$producto) {
            return $this->failNotFound('Producto no encontrado');
        }

        return $this->respond($producto);
    }

    /**
     * Return a new resource object, with default properties.
     *
     * @return ResponseInterface
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters.
     *
     * @return ResponseInterface
     */
    public function create()
    {
        $data = $this->request->getJSON(true);
        $this->model->insert($data);

        return $this->respondCreated(['message' => 'Producto creado']);
    }

    /**
     * Return the editable properties of a resource object.
     *
     * @param int|string|null $id
     *
     * @return ResponseInterface
     */
    public function edit($id = null)
    {
        //
    }

    /**
     * Add or update a model resource, from "posted" properties.
     *
     * @param int|string|null $id
     *
     * @return ResponseInterface
     */
    public function update($id = null)
    {
        //
        $data = $this->request->getJSON(true);
        $this->model->update($id, $data);

        return $this->respondUpdated(['message' => 'Producto actualizado']);
    }

    /**
     * Delete the designated resource object from the model.
     *
     * @param int|string|null $id
     *
     * @return ResponseInterface
     */
    public function delete($id = null)
    {
        $this->model->delete($id);

        return $this->respondDeleted(['message' => 'Producto eliminado']);
    }
}
