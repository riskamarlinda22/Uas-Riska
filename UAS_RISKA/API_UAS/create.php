<?php
include('config.php');

$name = $_POST['nama'];
$email = $_POST['email'];
$phone = $_POST['phone'];

$sql = "INSERT INTO users (nama, email, phone) VALUES ('$nama', '$email', '$phone')";

if ($conn->query($sql) === TRUE) {
    echo "Data berhasil ditambahkan.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
