let cache = new WeakMap();

function calculateResult(input){
    let key = input
    if(cache.has(key)){
        console.log("takeing result from the cache");
        return cache.get(key);
    }

    console.log("making calculations");
    let result = input.data + input.data;

    cache.set(key, result);

    return result;
}


let data1 = {data: "something"};
let result1 = calculateResult(data1);
console.log(result1);

let result2 = calculateResult(data1);
console.log(result2);

let data3 = {data: "something"};
let result3 = calculateResult(data3);
console.log(result3);