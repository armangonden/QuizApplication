<?php

require_once "config/init.php";

class Transaction
{
    /*----------------------------------------------------------------
    - Transaction is defined as perforing one quiz by one specific user.
    - There are two transaction tables; transaction and transactiondetails.
    - In transaction table;
    - There is one record for each transaction, which is created after submitting username and quiz.
    - Contains TransactionID, UserID, QuizID, Score and TransactionDate
    - Score is updated after quiz completed.
    -In transactiondetails table;
    - There is one record for every question in the selected quiz.
    - Each row is inserted after the related question answered.
    - Contains TransactionDetailID, TransactionID, UserID, QuizID, QuestionID, AnswerID(OptionID), TransactionDate and IsTrue

    -This transaction structure provides us logging every activities with a datetime.

    -------------------------------------------------------------------*/
    //Create Transaction when the user starts to the quiz
    public function create($TransactionID, $QuizID, $UserID)
    {
        $data = array(
            "TransactionID" => $TransactionID,
            "QuizID"        => $QuizID,
            "UserID"        => $UserID,
        );

        return DB::getInstance()->create("transaction", $data);
    }

    //Create Transaction details for each question in the quiz
    public function createDetail($TransactionID, $QuizID, $UserID, $QuestionID, $AnswerID)
    {
        $data = array(
            "TransactionDetailsID" => uniqid(),
            "TransactionID"        => $TransactionID,
            "QuizID"               => $QuizID,
            "UserID"               => $UserID,
            "QuestionID"           => $QuestionID,
            "AnswerID"             => $AnswerID,
            "IsTrue"               => Options::check($AnswerID),
        );
        return DB::getInstance()->create("transactiondetails", $data);
    }

    //Get transaction details
    public function get($TransactionID)
    {
        return DB::getInstance()->get('transactiondetails', array('TransactionID', '=', $TransactionID))->results();
    }

    //Get Questions and answers of the transaction as array(QuestionID => AnswerID)
    public function getAnswers($TransactionID)
    {
        $Transaction = self::get($TransactionID);
        foreach ($Transaction as $value) {
            $result[$value->QuestionID] = $value->AnswerID;
        }

        return $result;
    }

    //Update transaction table
    public function update($values = array(), $where = array())
    {
        return DB::getInstance()->update('transaction', $values, $where);
    }

    //Update score on transaction table
    public function updateScore($TransactionID, $Score)
    {
        return self::update(array("Score" => $Score), array("TransactionID", "=", $TransactionID));
    }
}
