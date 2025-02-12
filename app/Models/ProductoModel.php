<?php

namespace App\Models;

use CodeIgniter\Model;

class ProductoModel extends Model
{
    protected $table            = 'productos';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    // protected $returnType       = \App\Entities\ProductoEntity::class;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields = ['titulo', 'descripcion', 'imagen', 'precio', 'stock', 'categoria_id', 'creado_el'];

    protected bool $allowEmptyInserts = false;
    protected bool $updateOnlyChanged = true;

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'creado_el';
    protected $updatedField  = '';
    protected $deletedField  = '';
    // Validation
    protected $validationRules = [
        'titulo' => 'required|max_length[255]',
        'descripcion' => 'permit_empty',
        // regla de validacion para json array
        'imagen' => 'permit_empty|valid_json',
        'precio' => 'required|decimal',
        'stock' => 'integer|required',
        'categoria_id' => 'required|integer',
    ];
    protected $validationMessages = [
        'titulo' => [
            'required' => 'El título es obligatorio.',
            'max_length' => 'El título no puede exceder 255 caracteres.',
        ],
        'precio' => [
            'required' => 'El precio es obligatorio.',
            'decimal' => 'El precio debe ser un número decimal.',
        ],
        'stock' => [
            'required' => 'El stock es obligatorio.',
            'integer' => 'El stock debe ser un número entero.',
        ],
        'categoria_id' => [
            'required' => 'La categoría es obligatoria.',
            'integer' => 'La categoría debe ser un número entero.',
        ],
    ];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];
}
