<?php
// Configuración de la base de datos
$host = "localhost";
$dbname = "sistema_votacion"; // Nombre de la base de datos 
$user = "root"; //usuario y contraseña de phpmyadmin
$password = "";

try {
      // Establece conexión a la base de datos utilizando PDO (extension para acceder a la base de datos)
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Maneja errores de conexión a la base de datos
    die("Error de conexión a la base de datos: " . $e->getMessage());
}
?>
