
function assignObjects(object1, object2){
    return Object.assign(object1, object2);
}

console.log(assignObjects({name:"Daenerys", sobriquet:"Stormborn"}, {country:"Old Valyria", age: 13}));