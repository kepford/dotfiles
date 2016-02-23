<?php





















if (ini_get('auto_prepend_file') && !in_array(realpath(ini_get('auto_prepend_file')), get_included_files(), true)) {
include ini_get('auto_prepend_file');
}

if (is_file($_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR.$_SERVER['SCRIPT_NAME'])) {
return false;
}

$_SERVER = array_merge($_SERVER, $_ENV);
$_SERVER['SCRIPT_FILENAME'] = $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR.'index.php';


$_SERVER['SCRIPT_NAME'] = DIRECTORY_SEPARATOR.'index.php';
$_SERVER['PHP_SELF'] = DIRECTORY_SEPARATOR.'index.php';

require 'index.php';
