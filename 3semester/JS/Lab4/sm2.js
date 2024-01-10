let num = 10;

const inc = () => num++;
const inrn = number => number++;

const num1 = inc();
const num2 = inrn(num1);
console.log(num1)
console.log(num2);
