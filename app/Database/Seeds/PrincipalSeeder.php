<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class PrincipalSeeder extends Seeder
{
    public function run()
    {
        $this->call('CategoriaSeeder');
        $this->call('ProductoSeeder');
        $this->call('UsuarioSeeder');
    }
}
