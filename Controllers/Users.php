<?php

require_once "config/init.php";

class Users
{
    //Create User
    public function create($values)
    {
        return DB::getInstance()->create('users', $values);
    }

}
