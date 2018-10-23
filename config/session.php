<?php

class Session
{
    public static function put($name, $value)
    {
        return $_SESSION[$name] = $value;
    }

    public static function exists($name)
    {
        return (isset($_SESSION[$name])) ? true : false;
    }

    public static function delete($name)
    {
        if (self::exists($name)) {
            unset($_SESSION[$name]);
        }
    }

    public static function get($name)
    {
        return $_SESSION[$name];
    }

    public static function append($name, $val = array())
    {
        foreach ($val as $key => $value) {
            $_SESSION[$name][$key] = $value;
        }
        return $_SESSION[$name];
    }
}
