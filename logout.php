<?php
ini_set('session.save_path', '/home/i/i5a8/');
session_start();
session_destroy();
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>