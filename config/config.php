<?php

class Config
{

    public static function get($path = null)
    {
        if ($path) {
            $config = $GLOBALS['config'];
            $path   = explode('/', $path);

            foreach ($path as $dir) {
                if (isset($config[$dir])) {
                    $config = $config[$dir];
                }
            }
            return $config;
        }

    }
}
