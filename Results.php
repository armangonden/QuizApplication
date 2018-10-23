<?php
require_once 'config/init.php';

$User          = Session::get('user');
$Index         = Input::get('index');
$QuizID        = Input::get('QuizID');
$TransactionID = Session::get('TransactionID');
$QuestionIDs   = Questions::getIDs($QuizID);

//store last question's answer to the transactiondetails table
Transaction::createDetail(
    $TransactionID,
    $QuizID,
    $User['UserID'],
    $QuestionIDs[($Index - 1)],
    Input::get('switch_4')
);

//Get all answers from transactiondetails table as array( QuestionID => AnswerID)
$Answers = Transaction::getAnswers($TransactionID);
//Get number of correct answers by using IsTrue column on options table
$NumberOfCorrectAnswers = Quizzes::getResults($Answers);
//calculate score as percent
$Score = Quizzes::getScore($QuizID, $NumberOfCorrectAnswers);
//Update transaction score in the transaction table
Transaction::updateScore($TransactionID, $Score);

?>
<html>

<?php include "views/layouts/layout_head.php";?>



<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
			<div class="panel panel-default shadow index-panel wow animated zoomIn">
				<div class="panel-body index-panel-body">
					<div class="text-center" style="margin:auto;">
						<svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52"><circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/><path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/></svg>
						<h3 class="result-header">Thanks! <?php echo $User['Username']; ?></h3>
						<h4> Your Score is <?php echo $Score ?>% </h4>
						<div class="row text-center">
							You responded correctly to <?php echo $NumberOfCorrectAnswers ?> out of <?php echo count($Answers); ?> questions.
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
		</div>
	</div>
<?php include "views/layouts/layout_js.php";?>
</body>
</html>