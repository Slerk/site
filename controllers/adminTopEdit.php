<?php
session_start();
require_once "../DB.php";
$error ='';

$id = '';
$name_topic = '';

// Редактирование категории

if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
  // tt($_GET['id']);
    $id = $_GET['id'];

// выборка названия категории по идШнику

    $top = "SELECT * FROM topics WHERE id='$id'";
    $result_top = $connect->prepare($top);
    $result_top->execute();

    $final_top = $result_top->fetchAll(PDO::FETCH_ASSOC);

// name_topic
foreach ($final_top as $key => $value) {
  // tt($value);
  $name_topic = $value['name_topic'];
  $id = $value['id'];
}

}


if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['topic-edit'])) {
  // tt($_POST);
  $name_topic = $_POST['name_topic'];
  $id = $_POST['id'];


$error ='';

if(empty($name_topic)) {
  $error = 'Заполните поле';
}

if (strlen($name_topic)<=4 ) {
  $error = 'Слишком короткое название';
}


// Проверка на повторение
$quer = "SELECT name_topic FROM topics WHERE name_topic='$name_topic'";
$result = $connect->prepare($quer);
$result->execute();

$final = $result->fetchAll(PDO::FETCH_COLUMN);

if (!empty($final)) {
  $error = "Такая категория уже существует!";
}



if ($error == '') {



  $sql = "UPDATE `topics` SET  `name_topic` = '$name_topic' WHERE id = '$id'";
  $query = $connect->prepare($sql);
  $query->execute();


  $fin = $query->fetch(PDO::FETCH_ASSOC);
  header('location: ../admin/topicsAll.php');
}
}
