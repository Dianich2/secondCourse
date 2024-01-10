var b = 5;
let a = 6;

alert(window.b);
alert(window.alert);

window.b = 7;
alert(b);

function someFunction(){
    return "some string";
}
alert(window.someFunction());