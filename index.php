<?php

	require_once("database.php");
	require_once("models/articles.php");

	$dbc = db_connect();
	$articles = articles_all($dbc);

    include("views/articles.php"); ?>
