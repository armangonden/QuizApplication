<div class="col-sm-2"></div>
<div class="col-sm-8">
<div class="panel panel-default index-panel shadow">
	<div class="panel-body index-panel-body">
		<div class="text-center">
			<h1 class="index-title">Technical Quiz</h1>
		</div>
		<form action="<?php echo 'Questions.php' ?>" method="POST" name="startQuiz" onsubmit="return validateForm()">
			<div class="col-sm-2"></div>
				<div class="col-sm-8">
			<div class="form-input">

			<input type="text" class="form-control" placeholder="Name" name="username" id="username" required>



			</div>
			<div class="form-input">
				<select name="QuizID" class="form-control select-quizzes" id="QuizID">
					<option value="0">Please Select</option>
	<?php
$quizzes = Quizzes::get();

foreach ($quizzes as $key => $value) {
    echo "<option value=\"" . $key . "\">" . $value . "</option>";
}
?>
				</select>
			</div>
			<input type="hidden" name="QuestionID" value="1">
			<input type="hidden" name="StartFlag" value="true">
			<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">

			<div class="form-input text-center">
				<input type="submit" name="submit" value="Start" class="btn btn-primary btn-lg">
			</div>
			</div>
				<div class="col-sm-2"></div>
		</form>
	</div>
</div>
</div>
				<div class="col-sm-2"></div>


