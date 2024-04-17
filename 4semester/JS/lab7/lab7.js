let myPromise = new Promise(function(resolve, reject){
    let randomNumber = Math.floor(Math.random() * 10) + 1;
    setTimeout(() => resolve(randomNumber), 3000);
});

myPromise.then(
    result => console.log(result)
);



function myFunction(delay){
    return new Promise(function(resolve, reject){
        let randomNumber = Math.floor(Math.random() * 10) + 1;
    setTimeout(() => resolve(randomNumber), delay);
    });
}

Promise.all([myFunction(2000), myFunction(3000), myFunction(4000)])
    .then(values => console.log(values));


let myPromise2 = new Promise((resolve, reject) => {
    setTimeout(() => resolve(21), 4000);
});

myPromise2
    .then(result => {
    console.log(result);
})
    .then(result => 
        console.log(result)
        );

async function myFunction2(){

    let value = await myPromise2;
    console.log(value);
    let value2 = value * 2;
    console.log(value2);
}

myFunction2();