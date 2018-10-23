<?php
require_once 'config/init.php';

if (Token::check(Input::get('token'))) {
    ?>

<html>
	<?php require_once "views/layouts/layout_head.php";?>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center" id ="content">
					<?php require_once 'views/Question.php'?>
				</div>
			</div>
		</div>
		<?php require_once "views/layouts/layout_js.php";?>
	</body>
</html>

<?php } else {
    Redirect::to("./index.php");
}
?>