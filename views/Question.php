<?php

$StartFlag         = Input::get('StartFlag');
$QuizID            = Input::get('QuizID');
$index             = Input::get('QuestionID');
$QuestionIDs       = Questions::getIDs($QuizID);
$CurrentQuestionID = $QuestionIDs[$index - 1];
$Question          = Questions::getWithOptions($QuizID);
$countQuestions    = Questions::count($QuizID);

if ($StartFlag) {
    //clear answers array
    Session::delete('answers');

    //Create User
    $UserID = uniqid();
    Users::create(array('Username' => Input::get('username'), "UserID" => $UserID));
    Session::put("user", array('Username' => Input::get('username'), "UserID" => $UserID));

    //Create Transaction
    $TransactionID = uniqid();
    Session::put('TransactionID', $TransactionID);
    Transaction::create($TransactionID, $QuizID, $UserID);

    $StartFlag = false;
} else {
    //Session::append('answers', array($QuestionIDs[($index - 2)] => Input::get('switch_4')));
    //Store answer to transaction
    Transaction::createDetail(
        Session::get('TransactionID'),
        $QuizID,
        Session::get('user')['UserID'],
        $QuestionIDs[($index - 2)],
        Input::get('switch_4')
    );
}

$progressValue = intval((($index - 1) / $countQuestions) * 100);

if ($index == $countQuestions) {
    $post_url = "Results.php";
    $button   = '<input type="submit" value="Submit Quiz" class="btn btn-success btn-lg pull-center" id="nextButton"/>';
} else {
    $post_url = 'Questions.php';
    $button   = '<button class="btn btn-success btn-lg pull-center" id="nextButton">Next</button>';
}

?>

<div class="col-sm-2"></div>
<div class="col-sm-8">
  <div class="panel panel-default index-panel shadow wow animated fadeInLeft">
    <div class="panel-body index-panel-body">
      <form method="POST" action="<?php echo $post_url ?>" onsubmit="return validateQuestion()" name="questionForm">
        <input type="hidden" name="index" value ="<?php echo $index ?>">
        <input type="hidden" name="QuizID" value ="<?php echo $QuizID ?>">
        <input type="hidden" name="QuestionID" value ="<?php echo intval($index + 1) ?>">
        <input type="hidden" name="token" value="<?php echo Token::generate(); ?>">


        <div class="text-center">
          <h3 class="index-title"><?php echo $Question[$CurrentQuestionID]->QuestionName; ?></h3>
            <div class="row switch-field">
            <?php
foreach ($Question[$CurrentQuestionID]->Option as $value) {
    echo '<div class="col-sm-6 text-center">';
    echo '<input type="radio" id="switch_4_' . $value->OptionID . '" name="switch_4" value="' . $value->OptionID . '"/>';
    echo '<label class="pull-center option-label" for="switch_4_' . $value->OptionID . '">' . $value->OptionName . '</label>';

    echo '</div>';
}
?>
            </div>
        </div>
        <div class="row text-center">
          <div id="footer" class="pull-center">
          <?php
echo $button;
?>
          </div>
        </div>
        <div style="padding:0px 45px 0px 45px; margin: 20px 0px 20px 0px;">
          <div class="progress">
             <div class="progress-bar " role="progressbar" style="width:<?php echo $progressValue ?>%;" aria-valuenow="1" aria-valuemin="0" aria-valuemax="<?php echo $countQuestions; ?>"><?php echo $progressValue ?>%</div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="col-sm-2"></div>

