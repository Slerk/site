<?php
session_start();
require_once '../DB.php';
if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['delete_id'])) {

    $id = $_GET['delete_id'];

    $sql = "DELETE  FROM users WHERE id = $id";
    $query = $connect->prepare($sql);
    $query->execute();

    header('location: ../admin/usersAll.php');

}
 ?>
