<?php

namespace App\Entities;

use CodeIgniter\Entity\Entity;

class ProductoEntity extends Entity
{
    protected $datamap = [];
    protected $dates   = ['created_at', 'updated_at', 'deleted_at'];
    protected $casts   = [
        'imagen' => 'json',
    ];


    public function getImagen()
    {
        return json_decode($this->attributes['imagen']);
    }
}
