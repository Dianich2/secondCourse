function* coordsGenerator(){
    x = 0;
    y = 0;

    let command = yield;
    
    while(command != "quit"){
        switch (command){
            case "up" :{
                y += 10;
                command = yield "" + x + "." + y;
                break;
            }
            case "down": {
                y -= 10;
                command = yield "" + x + "." + y;
                break;
            }
            case "right": {
                x += 10;
                command = yield "" + x + "." + y;
                break;
            }
            case "left": {
                x -= 10;
                command = yield "" + x + "." + y;
                break;
            }
            default: {
                command = yield "incorret input";
                break;
            }
        }
    }
    return "quit";
}

let generator = coordsGenerator();
generator.next();
let coords;
while(true){
    coords = generator.next(prompt("input movement")).value;
    if(coords == "quit"){
        break;
    }
    alert(coords);
}