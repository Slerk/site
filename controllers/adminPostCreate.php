<?php
session_start();
require_once "../DB.php";



if (isset($_POST['title'],$_POST['content'])) {


$error ='';
//

if (!empty($_FILES['file']['name'])){
  // tt($_FILES);

  //даем уникальное имя файлу по времени добавления в секундах
    $img = time() . "_" . $_FILES['file']['name'];
    //временное имя
    $fileTmpName = $_FILES['file']['tmp_name'];
    //тип файла
    $fileType = $_FILES['file']['type'];
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
$mirror = $_POST['mirror'];




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


// Проверка на повторение
$quer = "SELECT title FROM posts WHERE title='$title'";
$result = $connect->prepare($quer);
$result->execute();

$final = $result->fetchAll(PDO::FETCH_COLUMN);

if (!empty($final)) {
  $error = "Такое название уже существует!";
}


// Если не выполрено условие,код прекращается
if ($error !=''){
  echo $error;
  exit();
}

$sql = 'INSERT INTO posts(title,content,id_topic,img,mirror) VALUES(?,?,?,?,?)';
$query = $connect->prepare($sql);
$query->execute([$title,$content,$topic,$img,$mirror]);

$finish = $query->fetch(PDO::FETCH_ASSOC);
echo 'Готово';
}
