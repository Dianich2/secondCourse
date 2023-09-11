let russianMark;
let mathMark;
let englishMark;

russianMark = prompt("Input russian language mark", 2);
mathMark = prompt("Input math mark", 2);
englishMark = prompt("Input english langusge mark", 2);

if(russianMark > 3 && mathMark > 3 && englishMark > 3){
    alert("Congratulations, you've been tranfered to the nex year!")
}
if(russianMark < 4 && mathMark < 4 && englishMark < 4){
    alert("Congratulations, you've been expelled from the university!");
}else if(russianMark < 4 || mathMark < 4 || englishMark < 4){
    alert("You have to retake your exam")
}