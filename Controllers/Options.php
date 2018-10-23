<?php

class Options
{
    //Get all options belongs to specific question
    public function get($QuestionID)
    {
        return DB::getInstance()->get('options', array('QuestionID', '=', $QuestionID))->results();
    }

    //Check option is true
    public function check($OptionID)
    {
        $Option = DB::getInstance()->get('options', array('OptionID', '=', $OptionID))->results();
        $isTrue = $Option[0]->IsTrue;
        return $isTrue;
    }

}
