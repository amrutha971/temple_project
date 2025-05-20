<?php

namespace App\Models;

use CodeIgniter\Model;

class PoojaModel extends Model
{
    protected $table = 'poojas';
    protected $primaryKey = 'id';
    protected $allowedFields = ['temple_id', 'name', 'price'];
    protected $returnType = 'array';
}
