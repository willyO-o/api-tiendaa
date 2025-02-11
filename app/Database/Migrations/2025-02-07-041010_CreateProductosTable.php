<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateProductosTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'titulo' => ['type' => 'VARCHAR', 'constraint' => 255],
            'descripcion' => ['type' => 'TEXT'],
            'imagen' => ['type' => 'JSON'],
            'precio' => ['type' => 'DECIMAL', 'constraint' => '10,2'],
            'stock' => ['type' => 'INT', 'constraint' => 11],
            'categoria_id' => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'creado_el' => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addForeignKey('categoria_id', 'categorias', 'id', 'CASCADE', 'CASCADE');
        $this->forge->addPrimaryKey('id');
        $this->forge->createTable('productos');
    }

    public function down()
    {
        $this->forge->dropTable('productos');
    }
}
