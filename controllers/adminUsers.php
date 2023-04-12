<?php
session_start();
require_once '../DB.php';

$sql = 'SELECT * FROM `users` ';
$query = $connect->prepare($sql); //подготовка запроса
    $query->execute();

    $user = $query->fetchAll(PDO::FETCH_ASSOC);
