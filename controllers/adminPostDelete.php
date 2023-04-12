<?php
session_start();
require_once '../DB.php';
if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['delPost_id'])) {

    $id = $_GET['delPost_id'];

    $sql = "DELETE FROM `posts` WHERE `id` = $id";
    $query = $connect->prepare($sql);
    $query->execute();

    header('location: ../admin/postsAll.php');

}
 ?>
