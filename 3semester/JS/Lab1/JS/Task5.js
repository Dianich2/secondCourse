let correctAnswers = ["марина", "марина федоровна", "кудлацкая марина федоровна"];
let isCorrect = false;

do{
    let userAnswer = prompt("Input teacher's name", "");
    if(correctAnswers.includes(userAnswer.toLowerCase())){
        alert("Correct input");
        isCorrect = true;
    }else{
        alert("Incorrect input, try again!")
    }
}while(!isCorrect);
