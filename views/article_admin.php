<!DOCTYPE html>
<html>
<head>
	<meta charset="utf8">
	<title>Первый блог</title>
	<link rel="stylesheet" href="http://localhost/bblog/style.css">
	<script type="text/javascript" src="newjs.js"></script>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1><a href="http://localhost/bblog/">Мой первый блог</a></h1><br>
		<a href="../admin/">Админ Панель</a> -
		<a href="http://localhost/bblog/admin/index.php?action=add">Добавить статью</a>
		<div>
			<form method="post" action="index.php?action=<?=$_GET['action']?>&id=<?=$_GET['id']?>">
				<input type="text" name="title" placeholder="Название статьи" value="<?=$article['title']?>" autofocus required><p>
				<input type="date" name="date" placeholder="Дата" value="<?=$article['date']?>" required><p>
				<textarea name="content" required><?=$article['content']?></textarea><p>
				<input type="submit" value="Сохранить">
			</form>
		</div>
		<footer>
			<p>Мой первый блог<br>Copyright &copy; 2017</p>
		</footer>
	</div>

</body>

</html>