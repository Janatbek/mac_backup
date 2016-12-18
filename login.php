<?php
require_once ('../_config.php');

$arr = $sm->Login(getVar('login_email'), getVar('login_password'), getVar('rememberme', 0));

header('Cache-Control: no-cache, must-revalidate');
header('Expires: '.date('r', time()+(86400*365)));
header('Content-type: application/json');

echo json_encode(array(
	'valid' => $arr[0],
	'error' => $arr[1],
	'redirect' => $arr[2]
));
?>