<?php

namespace App\Models;

use CodeIgniter\Model;

class CategoriaModel extends Model
{
    protected $table            = 'categorias';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields = ['categoria', 'estado'];

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
        'id' => 'permit_empty|integer',
        'categoria' => 'required|max_length[255]|is_unique[categorias.categoria,id,{id}]',
        'estado' => 'required|in_list[activo,inactivo]',
    ];

    protected $validationMessages = [
        'categoria' => [
            'required' => 'La categoría es obligatoria.',
            'max_length' => 'La categoría no puede exceder 255 caracteres.',
            'is_unique' => 'La categoría ya está registrada.',
        ],
        'estado' => [
            'required' => 'El estado es obligatorio.',
            'in_list' => 'El estado debe ser "activo" o "inactivo".',
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
