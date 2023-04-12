<?php
session_start();
require_once '../DB.php';

$sql = 'SELECT * FROM `topics` ';
$query = $connect->prepare($sql); //подготовка запроса
    $query->execute();

    $topic = $query->fetchAll(PDO::FETCH_ASSOC);
