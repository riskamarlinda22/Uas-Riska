<?php
include('config.php');

$id = $_POST['id'];

$sql = "DELETE FROM users WHERE id='$id'";

if ($conn->query($sql) === TRUE) {
    echo "Data berhasil dihapus.";
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
?>