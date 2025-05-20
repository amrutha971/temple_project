<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\TempleModel;
use App\Models\PoojaModel;

class Temples extends ResourceController
{
    public function index()
    {
        $model = new TempleModel();
        $temples = $model->findAll();
        return $this->respond($temples);
    }

    public function show($id = null)
    {
        $templeModel = new TempleModel();
        $poojaModel = new PoojaModel();

        $temple = $templeModel->find($id);
        if (!$temple) {
            return $this->failNotFound('Temple not found');
        }

        $poojas = $poojaModel->where('temple_id', $id)->findAll();

        return $this->respond([
            'temple' => $temple,
            'poojas' => $poojas,
        ]);
    }
}
