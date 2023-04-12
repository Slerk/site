<?php
session_start();
require_once "../DB.php";



if (isset($_POST['name_topic'])) {
// tt($_POST);
  $name_topic = $_POST['name_topic'];
// tt($_POST);
}

$error ='';

if(empty($name_topic)) {
  $error = 'Заполните поле';
}

if (strlen($name_topic)<3 ) {
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


// Если не выполрено условие,код прекращается
if ($error !=''){
  echo $error;
  exit();
}


$sql = 'INSERT INTO topics(name_topic) VALUES(?)';
$query = $connect->prepare($sql);
$query->execute([$name_topic]);

$fin = $query->fetch(PDO::FETCH_ASSOC);
echo 'Готово';
