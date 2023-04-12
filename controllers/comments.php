<?php
session_start();
require_once '../DB.php';



if(isset($_POST['username']) && ($_POST['message'])){

$error ='';
     $username = trim($_POST['username']);
     $message = trim($_POST['message']);
      $id =$_POST['id'];

}
      if(empty($username || $message )) {
        $error = 'Все поля должны быть заполнены!';
      }
      elseif(empty($message)) {
        $error = 'Нет сообщения';
      }
      elseif (strlen($message)<5) {
        $error = 'Слишком короткое сообщение';
      }


      // Если не выполрено условие,код прекращается
      if ($error !=''){
        echo $error;
        exit();
      }
else{

     $sql = 'INSERT INTO comment(name,mess,post_id) VALUES(?,?,?)';
     $query = $connect->prepare($sql);
     $query->execute([$username,$message,$id]);

echo 'Готово';
}


