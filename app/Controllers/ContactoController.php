<?php
namespace App\Controllers;

use App\Models\ContactoModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

class ContactoController extends ResourceController
{
    use ResponseTrait;
    protected $modelName = 'App\\Models\\ContactoModel';
    protected $format    = 'json';

    // Registrar contacto (sin token)
    public function create()
    {
        $data = $this->request->getJSON();
        if (!$data || !isset($data->nombre_completo, $data->correo, $data->mensaje)) {
            return $this->failValidationError('Faltan campos requeridos');
        }
        $contactoData = [
            'nombre_completo'    => $data->nombre_completo,
            'correo'             => $data->correo,
            'mensaje'            => $data->mensaje,
            'estado'             => 'pendiente',
            'fecha_registro'     => date('Y-m-d H:i:s'),
            'fecha_actualizacion'=> date('Y-m-d H:i:s'),
        ];
        $model = new ContactoModel();
        if ($model->insert($contactoData)) {
            return $this->respondCreated(['message' => 'Contacto registrado correctamente']);
        }
        return $this->failServerError('No se pudo registrar el contacto');
    }

    // Listar contactos (requiere token)
    public function index()
    {
        $page = $this->request->getVar('page') ?? 1;
        $limit = $this->request->getVar('limit') ?? 10;
        $search = $this->request->getVar('search');
        $estado = $this->request->getVar('estado');
        $fecha_desde = $this->request->getVar('fecha_desde');
        $fecha_hasta = $this->request->getVar('fecha_hasta');

        $builder = $this->model->builder();

        if ($search) {
            $builder->like('nombre_completo', $search)
                    ->orLike('correo', $search)
                    ->orLike('mensaje', $search);
        }

        if ($estado) {
            $builder->where('estado', $estado);
        }

        if ($fecha_desde) {
            $builder->where('DATE(fecha_registro) >=', $fecha_desde);
        }

        if ($fecha_hasta) {
            $builder->where('DATE(fecha_registro) <=', $fecha_hasta);
        }

        $total = $builder->countAllResults(false);
        $contactos = $builder
            ->orderBy('id', 'DESC')
            ->get($limit, ($page - 1) * $limit)
            ->getResult();

        return $this->respond([
            'total' => $total,
            'page' => $page,
            'limit' => $limit,
            'data' => $contactos,
        ]);
    }

    // Obtener contacto por ID (requiere token)
    public function show($id = null)
    {
        if (!$id) {
            return $this->failValidationError('ID no proporcionado');
        }
        $model = new ContactoModel();
        $contacto = $model->find($id);
        if (!$contacto) {
            return $this->failNotFound('Contacto no encontrado');
        }
        return $this->respond($contacto);
    }

    // Editar contacto (requiere token)
    public function update($id = null)
    {
        $data = $this->request->getJSON();
        if (!$id || !$data) {
            return $this->failValidationError('Datos insuficientes');
        }
        $model = new ContactoModel();
        $contacto = $model->find($id);
        if (!$contacto) {
            return $this->failNotFound('Contacto no encontrado');
        }
        $updateData = [
            'nombre_completo'    => $data->nombre_completo ?? $contacto['nombre_completo'],
            'correo'             => $data->correo ?? $contacto['correo'],
            'mensaje'            => $data->mensaje ?? $contacto['mensaje'],
            'estado'             => $data->estado ?? $contacto['estado'],
            'fecha_actualizacion'=> date('Y-m-d H:i:s'),
        ];
        if ($model->update($id, $updateData)) {
            return $this->respond(['message' => 'Contacto actualizado correctamente']);
        }
        return $this->failServerError('No se pudo actualizar el contacto');
    }

    // Eliminar contacto (requiere token)
    public function delete($id = null)
    {
        $model = new ContactoModel();
        if (!$model->find($id)) {
            return $this->failNotFound('Contacto no encontrado');
        }
        if ($model->delete($id)) {
            return $this->respondDeleted(['message' => 'Contacto eliminado correctamente']);
        }
        return $this->failServerError('No se pudo eliminar el contacto');
    }
}
