<?php session_start();
require_once '../DB.php';
?>

<!DOCTYPE html>
<html lang="ru" >
  <head>
    <!-- Бутстрап цсс -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='../css/style.css'>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <meta charset="utf-8">
    <title>WoW книги </title>
  </head>


<body>
<!-- Верхняя менюшка -->
<?php require_once '../include/header.php'; ?>
<!-- КАРУСЕЛЬ -->

 <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
   <div class="carousel-indicators">
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
   </div>
   <div class="carousel-inner">
     <div class="carousel-item active">
       <img src="../smeshnye.jpg" class="d-block w-100" alt="...">
       <div class="carousel-caption d-none d-md-block">
         <h5>Метка первого слайда</h5>
         <p>Некоторый репрезентативный заполнитель для первого слайда.</p>
       </div>
     </div>
     <div class="carousel-item">
       <img src="" class="d-block w-100" alt="...">
       <div class="carousel-caption d-none d-md-block">
         <h5>Метка второго слайда</h5>
         <p>Некоторый репрезентативный заполнитель для второго слайда.</p>
       </div>
     </div>
     <div class="carousel-item">
       <img src="" class="d-block w-100" alt="...">
       <div class="carousel-caption d-none d-md-block">
         <h5>Метка третьего слайда</h5>
         <p>Некоторый репрезентативный заполнитель для третьего слайда.</p>
       </div>
     </div>
   </div>
   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="prev">
     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
     <span class="visually-hidden">Предыдущий</span>
   </button>
   <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="next">
     <span class="carousel-control-next-icon" aria-hidden="true"></span>
     <span class="visually-hidden">Следующий</span>
   </button>
 </div>
<!-- Конец карусели -->

<!-- Верхние разделы -->
<div class="tps container">
<div class="row">

      <div class="tops col-md-4">
      <h2>Книги</h2>
      <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
      <p><a class="btn btn-secondary" href="../content/books.php">Изучить »</a></p>
    </div>

    <div class="tops col-md-4">
        <h2>Томы</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
        <p><a class="btn btn-secondary" href="../content/tom.php">Ознакомиться »</a></p>
      </div>

      <div class="tops col-md-4">
          <h2>Ролики</h2>
          <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
          <p><a class="btn btn-secondary" href="../content/vidos.php">Посмотреть»</a></p>
        </div>


</div>

</div>
<div class="container marketing">
<!-- Верхние разделы закончились -->



    <!-- START THE FEATURETTES -->
 <?php

 $sql = 'SELECT * FROM `posts` WHERE `id_topic` = 1  ORDER BY id DESC';
 $query = $connect->prepare($sql); //подготовка запроса
     $query->execute();
     $post = $query->fetchAll(PDO::FETCH_ASSOC);
// tt($post);
 ?>
    <hr class="featurette-divider">
<?php foreach ($post as $key => $value) :?>
  <div class="row ">
   <div class="bkImg col-md-6 ">

         <img src="../img/<?=$value['img'];?>"  alt="post">

      </div>
      <div class="col-md-6 ">
      <a href="secondBooks.php?id=<?=$value['id'];?> ">   <h2  class="featurette-heading"><?=$value['title'];?> <span class="text-muted">See for yourself.</span></h2></a>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
</div>
<hr class="featurette-divider">
<?endforeach;?>


    <!-- /END THE FEATURETTES -->

  </div>

<!-- ФУТЕР -->

<?php require_once '../include/footer.php'; ?>


<!-- Бутстрап javaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


</body>
</html>
