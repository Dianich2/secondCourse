let square_a = 5;
let rectangle_a = 45;
let rectangle_b = 21;

function getArea(x, y){
    if(y === undefined){
        return x*x;
    }
    return x*y;
}

let square_area = getArea(square_a);
let rectangle_area = getArea(rectangle_a, rectangle_b);

console.log(Math.floor(rectangle_area/square_area));