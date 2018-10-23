<?php

class Input
{

    public static function exists($method = 'POST')
    {
        if ($method == 'POST') {
            return isset($_POST) ? true : false;
        } else if ($method == 'GET') {
            return isset($_GET) ? true : false;
        }
    }

    public static function get($item)
    {
        if (isset($_POST[$item])) {
            return $_POST[$item];
        } else if (isset($_GET[$item])) {
            return $_GET[$item];
        }
        return '';
    }

}
