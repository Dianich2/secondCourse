let a = 5;
let b = 6;

// function params(a, b){
//     if (a == b || b == undefined){
//         return a * 4;
//     }
//     return a * b;
// }

let params = function(a, b){
    if (a == b || b == undefined){
        return a * 4;
    }
    return a * b;
}

// let params = (a,b) => {
//     if (a == b || b == undefined){
//         return a * 4;
//     }
//     return a * b;
// }

alert(params(a));