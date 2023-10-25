
let stringASCII = "ABC";
let total1 = "";

for(let i = 0; i < stringASCII.length; i++){
    let num = stringASCII[i].charCodeAt();
    total1 += num;
}

let total2 = total1.replace('7', '1');
let subtraction = parseInt(total1)- parseInt(total2);
console.log(subtraction);