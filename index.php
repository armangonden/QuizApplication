<?php
require_once "config/init.php";
?>

<html>
	<?php require_once "views/layouts/layout_head.php";?>

	<body>
		<div class="container">
			<div class="row">
				<?php require_once "views/StartQuiz.php";?>
			</div>
		</div>
		<?php require_once "views/layouts/layout_js.php";?>
		<script>
			$(document).ready(function() {
				$('.select-quizzes').select2();
			});
		</script>
	</body>
</html>
