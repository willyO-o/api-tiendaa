<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class CategoriaSeeder extends Seeder
{
    public function run()
    {
        $data = [
            [
                'categoria' => 'Ropa',
                'estado' => 'activo',
            ],
            [

                'categoria' => 'Electrodomésticos',
                'estado' => 'activo',
            ],
            [

                'categoria' => 'Tecnología',
                'estado' => 'activo',
            ],
            [

                'categoria' => 'Herramientas',
                'estado' => 'activo',
            ],
            [

                'categoria' => 'Juguetes',
                'estado' => 'activo',
            ],
        ];

        $this->db->table('categorias')->insertBatch($data);
    }
}
