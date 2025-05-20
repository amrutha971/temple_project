<?php

namespace App\Models;

use CodeIgniter\Model;

class TempleModel extends Model
{
    protected $table = 'temples';
    protected $primaryKey = 'id';
    protected $allowedFields = ['name', 'location', 'district'];
    protected $returnType = 'array';
}
