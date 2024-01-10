// let daysOfWeek = {
//     1: "Monday",
//     2: "Tuesday",
//     3: "Wednesday",
//     4: "Thursday",
//     5: "Friday",
//     6: "Saturday",
//     7: "Sunday",
// }

// let userDayNumber = parseInt(prompt("Input day of week (1-7)", ""));

// if(userDayNumber >= 1 && userDayNumber <= 7){
//     alert("this is " + daysOfWeed[userDayNumber]);
// }else{
//     alert("Incorrect input");
// }

let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
let userDayNumber = parseInt(prompt("Input day of week (1-7)", ""));
if(userDayNumber >= 1 && userDayNumber <= 7){
    alert("this is " + daysOfWeek[userDayNumber - 1]);
}else{
    alert("Incorrect input");
}
