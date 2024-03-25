

let formSize = document.getElementById("sizeForm");
let heightInput = document.getElementById("heightInput");
let widthInput = document.getElementById("widthInput");
let diametrInput = document.getElementById("diametrInput");
let counterInput = document.getElementById("resultInput");
let nap1 = document.getElementById("nap1");
let nap2 = document.getElementById("nap2");
let nap3 = document.getElementById("nap3");
let circle = document.getElementById("circle");
let messageSpan = document.getElementById("message");
let resetButton = document.getElementById("resetButton");

let actualLocation = 0;
let suggestedLocation = 0;
let counter = 0;



formSize.addEventListener("submit", function(event){

    event.preventDefault();

    if(parseInt(diametrInput.value) > parseInt(widthInput.value)){
        alert("Диаметр шарика не может быть больше ширины наперстка");
        return;
    }
    nap1.width = widthInput.value;
    nap1.height = heightInput.value;
    nap2.width = widthInput.value;
    nap2.height = heightInput.value;
    nap3.width = widthInput.value;
    nap3.height = heightInput.value;
    circle.width = parseInt(diametrInput.value);
    circle.height = parseInt(diametrInput.value);
    generateRandomLocation();
});

nap1.addEventListener("click", function(event){
    moveUp("nap1");
    suggestedLocation = 1;
    if(suggestedLocation == actualLocation){
        counter++;
        messageSpan.innerHTML = "Верно!";
    }else{
        if(counter != 0){
            counter--;
        }
        messageSpan.innerHTML = "Неверно!"
    }
    counterInput.value = counter;
    setTimeout(function(){moveDown("nap1")}, 2000);
})

nap2.addEventListener("click", function(event){
    moveUp("nap2");
    suggestedLocation = 2;
    if(suggestedLocation == actualLocation){
        counter++;
        messageSpan.innerHTML = "Верно!";
    }else{
        if(counter != 0){
            counter--;
        }
        messageSpan.innerHTML = "Неверно!"

    }
    counterInput.value = counter;
    setTimeout(function(){moveDown("nap2")}, 2000);
})

nap3.addEventListener("click", function(event){
    moveUp("nap3");
    suggestedLocation = 3;
    if(suggestedLocation == actualLocation){
        counter++;
        messageSpan.innerHTML = "Верно!";
    }else{
        if(counter != 0){
            counter--;
        }
        messageSpan.innerHTML = "Неверно!"
    }
    counterInput.value = counter;
    setTimeout(function(){moveDown("nap3")}, 2000);
})

resetButton.addEventListener("click", function(event){
    counter = 0;
    counterInput.value = "";
    messageSpan.innerHTML = "";
})

function moveUp(id) {
    let img = document.getElementById(id);
    img.style.top = (-1 * heightInput.value).toString() + "px";
}

function moveDown(id){
    let img = document.getElementById(id);
    img.style.top = "0px";
    generateRandomLocation();
    messageSpan.innerHTML = "";
}

function getRandomNumber() {
    return Math.floor(Math.random() * 3) + 1;
}

function generateRandomLocation(){

    actualLocation = getRandomNumber();

    switch(actualLocation){
        case 1:{
            circle.style.right = (widthInput.value * 2 + 40 + widthInput.value/2 + diametrInput.value/2).toString() + "px";
            break;
        }
        case 2:{
            circle.style.right = (widthInput.value * 1 + 40 + widthInput.value/2 + diametrInput.value/2).toString() + "px";
            break;
        }   
        case 3:{
            circle.style.right = (widthInput.value/2 + diametrInput.value/2).toString() + "px";
            break;
        }
    }
    
}
