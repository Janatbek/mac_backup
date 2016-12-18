<?php
require_once ('../_config.php');

$sm->Logout(getVar('c'));

header('Cache-Control: no-cache, must-revalidate');
header('Expires: '.date('r', time()+(86400*365)));
header('Content-type: application/json');

echo json_encode(array(
	'valid' => true,
	'error' => ''
));
?>