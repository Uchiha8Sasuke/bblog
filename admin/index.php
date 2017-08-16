<?php
	require_once "../database.php";
	require_once "../models/articles.php";

	$dbc = db_connect();
	$article['title']=''; 
	$article['date']='';
	$article['content']='';
	if(isset($_GET['action']))
		$action = $_GET['action'];
	else
		$action = "";

	if($action == "add"){
		if(!empty($_POST)){
			articles_new($dbc,$_POST['title'],$_POST['date'],$_POST['content']);
			header("Location: index.php");
		}
		include("../views/article_admin.php");

	}else if($action == "edit"){
		if(!isset($_GET['id']))
			header("Location: index.php");
		$id = (int)$_GET['id'];

		if($id > 0 && !empty($_POST)){
			articles_edit($dbc, $id, $_POST['title'], $_POST['date'], $_POST['content']);
			header("Location: index.php");
		}
		$article = articles_get($dbc, $id);
		include("../views/article_admin.php");
	}else if($action == "delete"){
		$id=$_GET['id'];
		$article = articles_delete($dbc, $id);
		header("Location: index.php");
	}else{
		$articles = articles_all($dbc);
		include("../views/articles_admin.php");
	};
?>