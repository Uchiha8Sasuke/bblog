<?php
	function articles_all($dbc){
		//ЗАПРОС
		$query = "SELECT * FROM articles ORDER BY id DESC";
		$result = mysqli_query($dbc, $query);

		if(!$result)
			die(mysqli_error($dbc));

		//Извлечение из ДБ
		$n = mysqli_num_rows($result);
		$articles = array();

		for($i = 0; $i < $n; $i++){
			$row = mysqli_fetch_assoc($result);
			$articles[] = $row;
		};

		return $articles;

	}


	function articles_get($dbc, $id_article){
		//ЗАПРОС
		$query = "SELECT * FROM articles WHERE id='$id_article'";
		$result = mysqli_query($dbc, $query);

		if(!$result)
			die(mysqli_error($dbc));

		$article = mysqli_fetch_assoc($result);

		return $article;
	}

	function articles_new($dbc, $title, $date, $content){
		//ПОДГОТОВКА
		$title = trim($title);
		$content = trim($content);

		//ПРОВЕРКА
		if($title == '')
			return false;

		//ЗАПРОС
		$t = "INSERT INTO articles (title, date, content) VALUES ('%s', '%s','%s')";

		$query = sprintf($t, mysqli_real_escape_string($dbc, $title), mysqli_real_escape_string($dbc, $date), mysqli_real_escape_string($dbc, $content));
		
		$result = mysqli_query($dbc, $query);

		if(!$result)
			die(mysqli_error($dbc));

		return true;

	}

	function articles_edit($dbc, $id, $title, $date, $content){
    	$title = trim($title);
    	$date = trim($date);
    	$content = trim($content);
    	$id = (int)$id;
    
    	if ($title == '')
        	return false;
    	$sql = "UPDATE articles SET title='%s', date='%s', content='%s' WHERE id='%d'";
    
    	$query = sprintf($sql, mysqli_real_escape_string($dbc, $title), mysqli_real_escape_string($dbc, $date), mysqli_real_escape_string($dbc, $content), $id);
    
    	$result = mysqli_query($dbc, $query);
    
    	if(!$result)
        	die(mysqli_error($dbc));
    
    	return mysqli_affected_rows($dbc);
	}

	function articles_delete($dbc, $id){
		$id=(int)$id;
		if($id==0)
			return false;

		// ЗАПРОС
		$query = sprintf("DELETE FROM articles WHERE id='%d' LIMIT 1", $id);
		$result = mysqli_query($dbc, $query);

		if(!$result)
			die(mysqli_error($dbc));

		return mysqli_affected_rows($dbc);
	}

	function articles_intro($text, $len=500){
		return mb_substr($text, 0, $len);
	}
?>