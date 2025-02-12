<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ProductoSeeder extends Seeder
{
    public function run()
    {

        $data = [
            [
                'titulo' => 'Polera de Varon Juvenil',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode(['https://i.imgur.com/QkIa5tT.jpeg']),
                'precio' => 45,
                'stock' => 10,
                'categoria_id' => 1,
            ],
            [
                'titulo' => 'Zapato de Varon ',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://batabolivia.vtexassets.com/arquivos/ids/188251-800-auto?v=638169225646400000&width=800&height=auto&aspect=true',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReBIfp0sXmSsJpmD5sXMeltH9LuE-XP7o8YcABeP2jQxH5gPai1PP8Dmql3Z8YWV3xlnM&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mtDoRLyapWYXfepaVC5qdm5yXSnA3SeC2z9qWNv3x7ORdJ3XFiH2tUUiovuQGJRR6P8&usqp=CAU'
                ]),
                'precio' => 245,
                'stock' => 3,
                'categoria_id' => 1,
            ],
            [
                'titulo' => 'Vestido de Dama ',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://cdnx.jumpseller.com/kadrihel1/image/39075964/resize/635/635?1693415938',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh_U-mBlGNXylsj4G7Ryqd_m_l_P_OHIhUzb4UE5vF8JZ_X12lHvOpDNP88m7pTsqrzpw&usqp=CAU'
                ]),
                'precio' => 370,
                'stock' => 3,
                'categoria_id' => 1,
            ],
            [
                'titulo' => 'Celular HONOR X8B 8G 256G Silver',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi863HW40r_Zwpme0Kb30B5mNn1hNPEA4-YrcfNgxaVJ8Ep7U9GnOdzflQ1nf_MjTwYV4&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL5sDd2fo26CMjtnFle74JoXidBozHwvvesHxqvUXr7a2a5rx4SS0GTwCUofpx7H1jQQQ&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUUPawsGykr5B2fZoLBlqnV2qWQBdV1AdOMfArGnhYCRf2m05BLGtPB8JOeETyc9r1q5Q&usqp=CAU'
                ]),
                'precio' => 4450,
                'stock' => 7,
                'categoria_id' => 3,
            ],
            [
                'titulo' => 'CELULAR XIAOMI POCO M5S 6+128GB GRIS ',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellend',
                'imagen' => json_encode([
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD0AWsDilrzHzfPAFv2aAiiA_CRztIlXsJGHeWhy_mqkBnGhn8pRXdpe8uWgQhI43Icc0&usqp=CAU',
                    'https://www.tiendaamiga.com.bo/media/catalog/product/cache/deb88dadd509903c96aaa309d3e790dc/c/e/celular_xiaomi_poco_m5s_gris.jpg',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFti6igTPTpDq7cYhXq3zScK9X2hkTmDtXUhOE6bpyYGi_CsmRYS3P2QPw6qVXIlR01RU&usqp=CAU'
                ]),
                'precio' => 2145,
                'stock' => 4,
                'categoria_id' => 3,

            ],
            [
                'titulo' => 'CELULAR IPHONE 13 128GB NEGRO ',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://www.tiendaamiga.com.bo/media/catalog/product/cache/deb88dadd509903c96aaa309d3e790dc/e/0/e06898__celular_iphone_13_128gb_negro.jpg',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuJpKhrDdwFQKQm3Peo8J-maulVP9jJ3-SBSeOwu9L_8xyJIHRIcb5vAgU3J9GgFVpCaw&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4GMFAUZw7oohQjo2ymdP6zRknNL0kP80wErzMQnA8utxqw7nin9CD7J1savvD7sNQywU&usqp=CAU'
                ]),
                'precio' => 7980,
                'stock' => 3,
                'categoria_id' => 3,
            ],
            [
                'titulo' => 'TALADRO ELÉCTRICO – 400W TOLSEN ',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://cablenortesrl.com/wp-content/uploads/2023/07/79500-e1584563286239.jpg',
                ]),
                'precio' => 245,
                'stock' => 10,
                'categoria_id' => 4,
            ],
            [
                'titulo' => 'Juego de Herramientas Racing 150pzas ',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://galba.com.bo/wp-content/uploads/2021/11/ST0145.jpg',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUq8ylia5Lk67LEpRWGZZy8EqpWrt2ICRFsQ9DgSDTQKT-hJtht5Ac3BA8kjtRxhnR0Ik&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2uPKaWhF5UAJLNvrjyY_l1a8q_TyNYESefCnuncP1i_cJ17K14lQa_sBY4ka0aGmEU-g&usqp=CAU'
                ]),
                'precio' => 725,
                'stock' => 3,
                'categoria_id' => 4,
            ],
            [
                'titulo' => 'Coche De Juguete Rojo Con Mando, Modelo Audi Tt Rs Vidax',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellendus nulla fuga exercitationem perferendis totam assumenda. Recusandae.',
                'imagen' => json_encode([
                    'https://storage.googleapis.com/catalog-pictures-carrefour-es/catalog/pictures/hd_510x_/8718475931409_1.jpg',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsUy2xxLa49gGsdL2PrPaCYHL42hVuDRn-BhmcBYQGv36c4icgi-tAw2ZCtlcnNtwma-s&usqp=CAU',
                ]),
                'precio' => 1645,
                'stock' => 1,
                'categoria_id' => 5,
            ],
            [
                'titulo' => 'Pelota Adidas Unisex Ip1648',
                'descripcion' => 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nostrum repudiandae quibusdam tempora. Laboriosam ipsa praesentium enim asperiores? Aut voluptate, rerum quos doloremque repellend',
                'imagen' => json_encode([
                    'https://oechsle.vteximg.com.br/arquivos/ids/17473871-998-998/2560104.jpg?v=638505967940100000',
                ]),
                'precio' => 75,
                'stock' => 16,
                'categoria_id' => 5,

            ]
        ];

        $this->db->table('productos')->insertBatch($data);
    }
}
