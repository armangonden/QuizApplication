<?php

class Questions
{

    //Get all questions belongs to specific quiz
    public function get($QuizID)
    {
        return DB::getInstance()->get('questions', array('QuizID', '=', $QuizID))->results();
    }

    //Get all questions belongs to specific quiz as array(QuestionID => Questionarray)
    public function getWithOptions($QuizID)
    {
        $questions = self::get($QuizID);
        $data      = array();

        foreach ($questions as $value) {
            $questionIDs[]            = $value->QuestionID;
            $data[$value->QuestionID] = $value;
        }

        foreach ($questionIDs as $value) {
            $option               = Options::get($value);
            $options[$value]      = $option;
            $data[$value]->Option = $option;
        }

        return $data;
    }

    //Get number of question in a specific quiz
    public function count($QuizID)
    {
        return count(self::get($QuizID));
    }

    //Get all questionID's belongs to the specific quiz
    public function getIDs($QuizID)
    {
        $Questions = self::get($QuizID);
        foreach ($Questions as $value) {
            $ids[] = $value->QuestionID;
        }
        return $ids;
    }

}
