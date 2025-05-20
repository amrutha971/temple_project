<?php

$routes->group('api', function($routes) {
    $routes->get('temples', 'TempleController::index');
    $routes->get('temples/(:num)', 'TempleController::show/$1');
    $routes->get('temples/table', 'TempleController::table'); // ← HTML table route
});
