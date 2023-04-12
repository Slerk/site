<?php
session_start();
require_once '../DB.php';

if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['but_reg'])){

  $login = trim($_POST['login']);
  $password = trim($_POST['password']);


$hash = password_hash($password,PASSWORD_DEFAULT);

$error = '';

    if ($login === ''| $hash ==='' ) {

  $error = "Не все поля заполнены";
    }


$sql = 'SELECT * FROM `users` WHERE `login` = :login';
$query = $connect->prepare($sql); //подготовка запроса
    $query->execute(['login'=>$login]);

    $user = $query->fetch(PDO::FETCH_ASSOC);

    // tt($user);

$ver = password_verify($user['password'], $hash);



    if($user && password_verify($password, $hash)){
      $_SESSION['login'] = $user['login'];
      $_SESSION['password'] = $user['password'] ;

      if ($user['admin']== 0) {

       header('Location: '. '../');
     }
     elseif ($user['admin']== 1) {
       header('location: ../admin/adminStr.php');
     }
    }else{
        $error = 'Неверно введены почта или пароль';
    }






    // if($_SESSION['admin']== 1){
    // header('location: ../admin/adminStr.php');
    // }



}






// $sql = 'SELECT * FROM `users` WHERE `login` = :login && `password` = :password';
//     $query = $connect->prepare($sql); //подготовка запроса
//     $query->execute(['login'=>$login,'password'=>$hash]);
//
//     $user = $query->fetch(PDO::FETCH_ASSOC);
//     // tt($user);
//     if ($user ==0) {
//
//        echo 'Такого пользователя не существует';
//     }
//     else {
//       // $_SESSION['login'] = $user['login'];
//       // $_SESSION['pass'] = $user['pass'];
//       //   $_SESSION['admin'] = $user['admin'];
//
//
//     header('Location: '. '../');
//     }
//
//
//     }
