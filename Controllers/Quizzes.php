<?php
require_once "config/init.php";

class Quizzes
{
    //Get all quizzes as array(QuizID => QuizName)
    public function get()
    {
        $Inputs = DB::getInstance()->get('quizzes')->results();

        foreach ($Inputs as $input) {
            $results[$input->QuizID] = $input->QuizName;
        }
        return $results;
    }

    //Get number of correct answers
    public function getResults($result = array())
    {
        $Correct = 0;
        foreach ($result as $QuestionID => $OptionID) {
            if (Options::check($OptionID)) {
                $Correct++;
            }
        }
        return $Correct;
    }

    //Calculate quiz score as a percentage
    public function getScore($QuizID, $NumberOfCorrectAnswers)
    {
        return intval(($NumberOfCorrectAnswers / Questions::count($QuizID)) * 100);

    }

}
