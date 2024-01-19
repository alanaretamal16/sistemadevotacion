<?php
// Conexión a la base de datos
require_once("db_config.php");

// Recoge los datos del formulario
$nombre = $_POST['nombre'];
$alias = $_POST['alias'];
$rut = $_POST['rut'];
$email = $_POST['email'];
$region = $_POST['region'];
$comuna = $_POST['comuna'];
$candidato = $_POST['candidato'];
$como_se_entero = isset($_POST['entero']) ? $_POST['entero'] : [];

// Validación, procesamiento y almacenamiento en la base de datos de datos del formulario
$query = "INSERT INTO votos (nombre, alias, rut, email, id_region, id_comuna, id_candidato, como_se_entero) 
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = $pdo->prepare($query);

// Sirve para ejecutar la consulta con los datos del formulario
$stmt->execute([$nombre, $alias, $rut, $email, $region, $comuna, $candidato, implode(",", $como_se_entero)]);

// Redirección a success.html
header('Location: success.html');
exit(); // Asegura que el script se detenga después de la redirección
?>
