let productsList = new Map();

function addProduct(id, name, amount, price){
    productsList.set(id, {name: name, amount:amount, price:price});
}

function removeProduct(id){
    productsList.delete(id);
}

function removeProduct(name){
    productsList.forEach((value, key) =>{
        if(value.name == name){
            productsList.delete(key);
        }
    })
}

function changeAmount(name, newAmount){
    productsList.forEach((value) =>{
        if(value.name == name){
            value.amount = newAmount
        }
    })
}

function changePrice(name, newPrice){
    productsList.forEach((value) =>{
        if(value.name == name){
            value.price = newPrice;
        }
    })
}

function countTotlaPrice(map){
    let totalPrice = 0;
    map.forEach((value) =>{
        totalPrice += value.amount * value.price;
    })
    return totalPrice;
}


addProduct(1, "product1", 2, 3.5);
addProduct(2, "product2", 6, 1.5);
addProduct(3, "product2", 7, 1.5);
addProduct(4, "product1", 3, 2.5);
addProduct(5, "product5", 4, 3.6);

console.log(productsList);
removeProduct("product5");
changePrice("product2", 100);
changeAmount("product2", 20);
console.log(productsList);
console.log("size of list: " + productsList.size);
console.log("Total price of the list: " + countTotlaPrice(productsList));