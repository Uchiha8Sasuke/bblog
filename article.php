<?php

	require_once("database.php");
	require_once("models/articles.php");

	$dbc = db_connect();
	$article = articles_get($dbc, $_GET['id']);

	include("views/article.php");

?>