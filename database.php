<?php
define('MYSQL_SERVER', 'localhost');
define('MYSQL_USER', 'root');
define('MYSQL_PASS', '');
define('MYSQL_DB', 'bblog');

function db_connect(){
	$dbc = mysqli_connect(MYSQL_SERVER, MYSQL_USER, MYSQL_PASS, MYSQL_DB) 
		or die('Ошибка:' . mysqli_error($dbc));
	if(!mysqli_set_charset($dbc, "utf8")){
		printf('Ошибка:' . mysqli_error($dbc));
	};

	return $dbc;
}
?>