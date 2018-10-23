<?php

class DB
{
    private static $_instance = null;
    private $_pdo;
    private $_query;
    private $_error = false;
    private $_results;
    private $_count = 0;

    private function __construct()
    {
        try {
            $hostname   = Config::get('mysql/host');
            $dbname     = Config::get('mysql/db');
            $dbuser     = Config::get('mysql/username');
            $dbpass     = Config::get('mysql/password');
            $this->_pdo = new PDO('mysql:host=' . $hostname . ';dbname=' . $dbname, $dbuser, $dbpass);
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    public static function getInstance()
    {
        if (!isset(self::$_instance)) {
            self::$_instance = new DB();
        }
        return self::$_instance;
    }

    public function query($sql, $params = array())
    {
        $this->_error = false;
        if ($this->_query = $this->_pdo->prepare($sql)) {
            $x = 1;
            if (count($params)) {
                foreach ($params as $param) {
                    $this->_query->bindValue($x, $param);
                    $x++;
                }
            }
            if ($this->_query->execute()) {
                $this->_results = $this->_query->fetchAll(PDO::FETCH_OBJ);
                $this->_count   = $this->_query->rowCount();
            } else {
                $this->_error = true;
            }
        }
        return $this;
    }

    public function action($action, $table, $where = array(), $column = '*')
    {
        $operators = array('=', '<', '>', '>=', '<=');
        if (count($where) == 0) {
            $sql = "{$action} {$column} FROM {$table}";
            if (!$this->query($sql)->error()) {
                return $this;
            }
        } else if (count($where) === 3) {

            $field     = $where[0];
            $operator  = $where[1];
            $condition = $where[2];

            if (in_array($operator, $operators)) {
                $sql = "{$action} {$column} FROM {$table} WHERE {$field} {$operator} ?";
                if (!$this->query($sql, array($condition))->error()) {
                    return $this;
                }
            }
        }
        return false;
    }

    public function get($table, $where = array(), $column = '*')
    {
        return $this->action("SELECT", $table, $where, $column);
    }

    public function create($table, $values = array())
    {
        if (count($values)) {
            $keys = array_keys($values);
            $vals = '';
            $x    = 1;

            foreach ($values as $value) {
                $vals .= '?';
                if ($x < count($values)) {
                    $vals .= ', ';
                }
                $x++;
            }

            $sql = "INSERT INTO {$table} (`" . implode("`,`", $keys) . "`) VALUES ({$vals})";

            if (!$this->query($sql, $values)->error()) {
                return true;
            }
        }
        return false;
    }

    public function update($table, $values = array(), $where = array())
    {
        if (count($values)) {
            $operators = array('=', '<', '>', '>=', '<=');
            $x         = 1;
            $set       = '';
            foreach ($values as $key => $value) {
                $set .= '`' . $key . '` = "' . $value . '"';
                if ($x < count($values)) {
                    $set .= ', ';
                }
                $x++;
            }

            if (count($where) === 3) {

                $field     = $where[0];
                $operator  = $where[1];
                $condition = $where[2];

                if (in_array($operator, $operators)) {
                    $sql = "UPDATE {$table} SET {$set} WHERE `{$field}` {$operator} ?";
                    if (!$this->query($sql, array($condition))->error()) {
                        return $this;
                    }
                }
            }

        }
    }

    public function results()
    {
        return $this->_results;
    }

    public function error()
    {
        return $this->_error;
    }

}
