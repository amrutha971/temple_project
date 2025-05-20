<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\TempleModel;
use App\Models\PoojaModel;

class TempleController extends ResourceController
{
    // GET /api/temples (JSON)
    public function index()
    {
        $model = new TempleModel();
        $temples = $model->findAll();
        return $this->respond($temples);
    }

    // GET /api/temples/{id} (JSON with poojas)
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

    // GET /api/temples/table (HTML Table View)
    public function table()
    {
        $templeModel = new TempleModel();
        $temples = $templeModel->findAll();

        $html = "<!DOCTYPE html>
        <html>
        <head>
            <title>Temples of Kerala</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background: #f9f9f9;
                    padding: 30px;
                }
                h2 {
                    text-align: center;
                    color: #2c3e50;
                }
                table {
                    border-collapse: collapse;
                    width: 80%;
                    margin: 20px auto;
                    background: #fff;
                    box-shadow: 0 0 10px rgba(0,0,0,0.1);
                }
                th, td {
                    padding: 12px 20px;
                    border: 1px solid #ddd;
                    text-align: left;
                }
                th {
                    background-color: #2980b9;
                    color: white;
                }
                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }
                tr:hover {
                    background-color: #f1f1f1;
                }
            </style>
        </head>
        <body>
            <h2>Temples of Kerala</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Location</th>
                    <th>District</th>
                </tr>";

        foreach ($temples as $t) {
            $html .= "<tr>
                        <td>" . htmlspecialchars($t['id']) . "</td>
                        <td>" . htmlspecialchars($t['name']) . "</td>
                        <td>" . htmlspecialchars($t['location']) . "</td>
                        <td>" . htmlspecialchars($t['district']) . "</td>
                      </tr>";
        }

        $html .= "</table>
        </body>
        </html>";

        return $this->response->setContentType('text/html')->setBody($html);
    }
}
