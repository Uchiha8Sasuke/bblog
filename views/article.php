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
		<h1><a href="http://localhost/bblog/">Мой первый блог</a></h1>
	
		<div>
			<div class="article">
				<h3>
					<?=$article['title']?>
				</h3>
				<em>
					Опубликовано: <?=$article['date']?>
				</em>
				<p>
					<?=$article['content']?>
				</p>
			</div>
		</div>
		<footer>
			<p>Мой первый блог<br>Copyright &copy; 2017</p>
		</footer>
	</div>
</body>

</html>