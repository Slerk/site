<?php
session_start();
require_once "../DB.php";
$error ='';

$id = '';
$title = '';
$content = '';

    // Редактирование поста

if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {

    $id = $_GET['id'];

// выборка названия категории по идШнику

    $top = "SELECT * FROM posts WHERE id='$id'";
    $result_post = $connect->prepare($top);
    $result_post->execute();

    $final_post = $result_post->fetchAll(PDO::FETCH_ASSOC);

// name_topic
foreach ($final_post as $key => $value) {

  $id = $value['id'];
  $title = $value['title'];
  $content = $value['content'];
  $id_topic = $value['id_topic'];

}

}

if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['edit_post'])) {

$id = $_POST['id'];
 $error ='';

        // загрузка картинки
  if (!empty($_FILES['img']['name'])){

    //даем уникальное имя файлу по времени добавления в секундах
      $img = time() . "_" . $_FILES['img']['name'];

      //временное имя
      $fileTmpName = $_FILES['img']['tmp_name'];
      //тип файла
      $fileType = $_FILES['img']['type'];
      //место хранения изображения
      $destination = "../img/" . $img;



      if (strpos($fileType, 'image') === false) {
          $error = "Подгружаемый файл не является изображением!";
      }else{
          $result = move_uploaded_file($fileTmpName, $destination);

          if ($result){

               $_POST['img'] =$img ;

          }
          else{
              $error = "Ошибка загрузки изображения на сервер";
          }
      }
  }
  else{
      $error= "Ошибка получения картинки";
  }

  $title = $_POST['title'];
  $content = $_POST['content'];
  $topic = $_POST['topic'];



  if(empty($title)) {
    $error = 'Введите заголовок';
  }
  elseif (strlen($title)<5) {
    $error = 'Слишком короткое название';
  }
  elseif (empty($content)) {
    $error = 'Введите содержание';
  }
  elseif (strlen($content)<=20) {
  $error = 'Слишком мало содержания';
  }


if ($error == '') {


  $sql = "UPDATE `posts` SET  `title` = '$title',`content` = '$content',`id_topic` = '$topic',`img` = '$img' WHERE id = '$id'";
  $query = $connect->prepare($sql);
  $query->execute();


  $fin = $query->fetch(PDO::FETCH_ASSOC);
  header('location: ../admin/postsAll.php');
}
}
