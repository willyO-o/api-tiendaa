<?php

namespace App\Libraries;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JwtHandler
{
    private $key =  'my_secret_key';
    private $algorithm = 'HS256';

    public function generateToken($data)
    {
        $this->key = env('JWT_SECRET');
        return JWT::encode($data, $this->key, $this->algorithm);
    }

    public function validateToken($token)
    {
        try {
            return JWT::decode($token, new Key($this->key, $this->algorithm));
        } catch (\Exception $e) {
            return false;
        }
    }
}