<?php
namespace App\Models;

use CodeIgniter\Model;

class ContactoModel extends Model
{
    protected $table      = 'contactos';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;

    protected $allowedFields = [
        'nombre_completo',
        'correo',
        'mensaje',
        'estado',
        'fecha_registro',
        'fecha_actualizacion',
    ];

    protected $useTimestamps = false;
}
