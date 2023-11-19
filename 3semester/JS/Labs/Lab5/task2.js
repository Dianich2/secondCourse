function volume(l){
    return (w, h) => {
        return l * w * h;
    };
}

let hW = volume(5);
let volume1 = hW(6, 7);
let volume2 = hW(3, 6);
let volume3 =  hW(7, 2);
let volume4 = volume(4)(2, 6);

console.log(volume1, volume2, volume3, volume4);