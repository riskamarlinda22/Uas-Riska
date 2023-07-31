<?php
include('config.php');

$id = $_POST['id'];
$name = $_POST['nama'];
$email = $_POST['email'];
$phone = $_POST['phone'];

$sql = "UPDATE users SET nama='$nama', email='$email', phone='$phone' WHERE id='$id'";

if ($conn->query($sql) === TRUE) {
    echo "Data berhasil diperbarui.";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>
