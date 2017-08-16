<!DOCTYPE html>
<html>
<head>
	<meta charset="utf8">
	<title>Первый блог</title>
	<link rel="stylesheet" href="http://bblog.com/style.css">
	<script type="text/javascript" src="newjs.js"></script>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1><a href="http://localhost/bblog/">Мой первый блог</a></h1><br>
		<a href="../admin/">Админ Панель</a> -
		<a href="index.php?action=add">Добавить статью</a>
		<div>
			<?php foreach($articles as $a): ?>
			<div class="row">
					<?=$a['id']?> - 
					<em>Опубликовано: <?=$a['date']?></em> -
					<a href="../article.php?id=<?=$a['id']?>"> <?=$a['title']?> </a> -
					<a href="index.php?action=edit&id=<?=$a['id']?>">Редактировать </a> -
					<a href="index.php?action=delete&id=<?=$a['id']?>">Удалить </a>
			</div>
			<?php endforeach; ?>
		</div>
		<footer>
			<p>Мой первый блог<br>Copyright &copy; 2017</p>
		</footer>
	</div>

</body>

</html>