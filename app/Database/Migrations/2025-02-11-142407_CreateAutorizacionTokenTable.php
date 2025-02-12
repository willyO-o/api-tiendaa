<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateAutorizacionTokenTable extends Migration
{
    public function up()
    {
        // Definir los campos de la tabla
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'usuario_id' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'null'           => false,
            ],
            'token' => [
                'type'           => 'text',
                'constraint'     => 1000, // Longitud suficiente para almacenar tokens JWT
                'null'           => false,
            ],
            'expira_el' => [
                'type'           => 'DATETIME',
                'null'           => false,
            ],
            'esta_activo' => [
                'type'           => 'TINYINT',
                'constraint'     => 1,
                'default'        => 1, // Por defecto, el token está activo
                'null'           => false,
            ],
            'tipo' => [
                'type'           => 'ENUM("access", "refresh")',
                'null'           => false,
            ],
            'creado_el' => [
                'type'           => 'DATETIME',
                'null'           => false,
            ],

        ]);

        // Agregar clave primaria
        $this->forge->addPrimaryKey('id');

        // Agregar clave foránea para relacionar con la tabla usuarios
        $this->forge->addForeignKey('usuario_id', 'usuarios', 'id', 'CASCADE', 'CASCADE');

        // Crear la tabla
        $this->forge->createTable('autorizacion_tokens');
    }

    public function down()
    {
        // Eliminar la tabla
        $this->forge->dropTable('autorizacion_tokens');
    }
}
