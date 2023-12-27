// class Chameleon {
//     static colorChange(newConlor){
//         this.newConlor = newConlor;
//         return this.newConlor;
//     }

//     constructor({newConlor = "green"} = {}){
//         this.newConlor = newConlor;
//     }
// }

// const freddie = new Chameleon({newConlor: "purple"});
// freddie.colorChange("orange");

// const list = [1 + 2, 1 * 2, 1 / 2]
// console.log(list);

// console.log(`${(x => x)('I love')} to program`)

// const add = () =>{
//     const cache = {};
//     return num => {
//         if (num in cache){
//             return `From cache! ${cache[num]}`;
//         }else{
//             const result = num + 10;
//             cache[num] = result;
//             return `Calculated! ${result}`;
//         };
//     };
// }

// const addFunction = add();
// console.log(addFunction(10));
// console.log(addFunction(10));
// console.log(addFunction(5 * 2));


// function Car(){
//     this.make = "Lamborgini";
//     return {make: "Maserate"};
// }

// const MyCar = new Car();
// console.log(MyCar.make);

// console.log("I want pizza"[0]);

// console.log('M' === 'M');

// function sayHi(name){
//     return `Hi there, ${name}`
// }
// console.log(sayHi());

// class Person{
//     constructor(name){
//         this.name = name;
//     }
// }
// const member = new Person("John")
// console.log(typeof member);

// const myFunc = ({x, y, z}) => {
//     console.log(x, y, z);
// }

// myFunc(1, 2, 3);

// function compareMembers(person1, person2 = person){
//     if(person1 !== person2){
//         console.log("Not the same!")
//     }else{
//         console.log("They are the same!")
//     }
// }

// const person = {nmae: "Lydia"}

// compareMembers(person);

// function* generator(i){
//     yield i;
//     yield i * 2;
// }

// const gen = generator(10);

// console.log(gen.next().value)
// console.log(gen.next().value)

// const set = new Set();
// set.add(1);
// set.add("Lidia");
// set.add({name: "Lydia"});
// for(let item of set){
//     console.log(item+2);
// }

// function sum(num1, num2 = num1){
//     console.log(num1 + num2)
// }

// sum(10);

// function sumValues(x, y, z){
//     return x + y + z;
// }

// console.log(sumValues(...[1,2,3]));
// console.log(sumValues([...[1,2,3]]));

// console.log(sumValues([1,2,3]));

// const one = (false || {} || null);
// const two = (null || false || "");
// const three = ([] || 0 || true);
// console.log(one, two, three);

// function getItems(fruitList, ...args, favouriteFruit){
//     return [...fruitList, ...args, favouriteFruit]
// }

// let items = getItems(["banana", "apple"], "pear", "lemon");
// console.log(items);

// console.log(3 + 4 + "5");

// const myMap = new Map();
// const myFunc = () => 'greeting';
// myMap.set(myFunc, "Hello world!")

// console.log(myMap.get('greeting'))
// console.log(myMap.get(myFunc))
// console.log(myMap.get(() => 'greeting'))

// const person = {
//     name: "Lydia",
//     age: 21
// }

// let city = person.city
// city = "Amsterdam"

// console.log(person);

// function sayHi(){
//     return (() => 0)();
// }

// console.log(typeof sayHi())

// class Counter {
//     constructor(){
//         this.count = 0;
//     }

//     increment(){
//         this.count++;
//     }
// }

// const counterOne = new Counter();
// counterOne.increment();
// counterOne.increment();

// const counterTwo = counterOne;
// counterTwo.increment();
// console.log(counterOne.count);

// const add = x => y => z => {
//     console.log(x, y, z);
//     return x + y + z;
// };

// add(4)(5)(6);

// const getList = ([x, ...y]) => [x, y]
// const getUser = user => {age: user.age};

// const list = [1, 2, 3, 4]
// const user = {name: "Lydia", age: 21}

// console.log(getList(list));
// console.log(getUser(user));