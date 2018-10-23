
function validateForm() {
	var form = document.forms["startQuiz"];
    var name = form["username"].value;
    var quiz = form["QuizID"].value;
    if (name == "") {	
        alert("Please enter your name");
        return false;
    }
    if(quiz == 0){
    	alert("Please pick a quiz!");
    	return false;
    }
}


function validateQuestion(){
    var radios = document.forms["questionForm"]["switch_4"];
    console.log(radios.length);
     for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
        return true; // checked
        }
    };
    alert("Please answer the question!");
    return false;

}