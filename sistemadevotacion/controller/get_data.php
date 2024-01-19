<?php

// Incluye el archivo de configuración de la base de datos
require_once("../models/db_config.php");

// Tipo de datos solicitados (region, comuna, candidato)
$type = $_GET['type'];

// Inicializa el array o arreglo para almacenar los datos
$data = [];

// Realiza consultas según el tipo
switch ($type) {
    case 'region':
        // Consulta para obtener las regiones
        $query = "SELECT id, nombre FROM regiones";
        break;
    case 'comuna':
        // Consulta para obtener las comunas
        $query = "SELECT id, nombre FROM comunas";
        break;
    case 'candidato':
        // Consulta para obtener los candidatos
        $query = "SELECT id, nombre FROM candidatos";
        break;
    default:
        // Si el tipo de datos no es válido, se termina el script con un mensaje
        die('Tipo de datos no válido');
}

// Prepara la consulta con un statement
$stmt = $pdo->prepare($query);

// Ejecuta la consulta y almacenar los resultados en $data
$stmt->execute();

// FetchAll obtendrá todos los resultados
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Devuelve los datos como JSON
echo json_encode($data);
?>

