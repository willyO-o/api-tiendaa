<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class UsuarioSeeder extends Seeder
{
    public function run()
    {
        $data = [
            [
                'email' => 'administrador@gmail.com',
                'password' => password_hash('123456', PASSWORD_BCRYPT),
                'estado' => 'activo',
                'creado_el' => date('Y-m-d H:i:s'),
            ]
        ];

        // Using Query Builder

        $this->db->table('usuarios')->insertBatch($data);

    }
}
