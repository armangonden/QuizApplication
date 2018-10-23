<?php
session_start();

$GLOBALS['config'] = array(
    'mysql'   => array(
        'host'     => '127.0.0.1',
        'username' => 'root',
        'password' => '',
        'db'       => 'quiz',
    ),
    'session' => array(
        'name'       => 'user',
        'token_name' => 'token',
    ),
);

spl_autoload_register(function ($class) {
    if (file_exists('config/' . $class . '.php')) {
        require_once 'config/' . $class . '.php';
    }
    if (file_exists('Controllers/' . $class . '.php')) {
        require_once 'Controllers/' . $class . '.php';
    }
    if (file_exists('views/' . $class . '.php')) {
        require_once 'views/' . $class . '.php';
    }
});
