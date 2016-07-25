#!/usr/bin/php
<?php
$input = file_get_contents('php://stdin');
preg_match('|^To: (.*)|', $input, $matches);
$t = tempnam("/tmp/mail", $matches[1]);
$t .= ".html";
file_put_contents($t, $input);

/* Name this for example sendmail.php , add it to php.ini as sendmail_path=/path/to/sendmail.php and create a writeable directory in /tmp called m. Everything sent by php mail() will land in there. */
/* http://www.drupal4hu.com/node/55 */
