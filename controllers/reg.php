<?php
session_start();
require_once "../DB.php";



if (isset($_POST['login'],$_POST['email'],$_POST['password'])) {

  $login = trim($_POST['login']);
  $email = trim($_POST['email']);
  $password = trim($_POST['password']);


}

$error ='';

if (empty($admin)) {
  $admin = 0;
}else {
  $admin = 1;
}


if(empty($email)) {
  $error = 'Введите адрес';
}


if (strlen($login)<=3 ) {
  $error = 'Логин должен иметь хотя-бы 4 символа';
}
// Проверка на повторение логина
$quer = "SELECT login FROM users WHERE login='$login'";
$result = $connect->prepare($quer);
$result->execute();

$final = $result->fetchAll(PDO::FETCH_COLUMN);

if (!empty($final)) {
  $error = "Такой логин уже занят,придумайте другой!";
}

// Проверка на повторение почты

$quer = "SELECT email FROM users WHERE email='$email'";
$result = $connect->prepare($quer);
$result->execute();

$final = $result->fetchAll(PDO::FETCH_COLUMN);

if (!empty($final)) {
  $error = "Такая почта уже зарегистрирована";
}
// длина пароля
if (strlen($password)<5 ) {
  $error = 'Пароль слишком короткий';
}
// Хеширование пароля
$hash = password_hash($password,PASSWORD_DEFAULT);


// Если не выполрено условие,код прекращается
if ($error !=''){
  echo $error;
  exit();
}

// Добавление в БД

$sql = 'INSERT INTO users(login,email,password,admin) VALUES(?,?,?,?)';
$query = $connect->prepare($sql);
$query->execute([$login,$email,$hash,$admin]);

$finish = $query->fetch(PDO::FETCH_ASSOC);
echo 'Готово';

$_SESSION['login'] = $login;
$_SESSION['password'] = $hash ;

  $sqAmd =  'SELECT * FROM `users` WHERE `admin` =`admin`';
  $res = $connect->prepare($sqAmd);
  $res->execute();

$finish = $res->fetchAll(PDO::FETCH_ASSOC);



if($_SESSION['admin']){
  header('location: ../admin/adminStr.php');
}






 ?>
