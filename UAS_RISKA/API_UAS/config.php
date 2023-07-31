<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'yudi_011190077';

$conn = new mysqli($localhost, $root, , $yudi_011190077);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>