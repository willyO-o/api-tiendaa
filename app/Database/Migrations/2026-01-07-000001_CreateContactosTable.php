<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateContactosTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'nombre_completo' => [
                'type'       => 'VARCHAR',
                'constraint' => 150,
            ],
            'correo' => [
                'type'       => 'VARCHAR',
                'constraint' => 100,
            ],
            'mensaje' => [
                'type' => 'TEXT',
            ],
            'estado' => [
                'type'       => 'ENUM',
                'constraint' => ['pendiente', 'leido', 'papelera'],
                'default'    => 'pendiente',
            ],
            'fecha_registro' => [
                'type'    => 'DATETIME',
                'null'    => false,
            ],
            'fecha_actualizacion' => [
                'type'    => 'DATETIME',
                'null'    => true,
            ],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('contactos');
    }

    public function down()
    {
        $this->forge->dropTable('contactos');
    }
}
