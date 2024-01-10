let productsList = new Set();

function addProduct(product){
    productsList.add(product);
}

function removeProduct(product){
        return productsList.delete(product);
}

function hasProduct(product){
    return productsList.has(product);
}

function getAmount(set){
    return set.size;
}

addProduct("product1");
addProduct("product2");
addProduct("product3");
addProduct("product3");

console.log(productsList);

removeProduct("product2");
console.log(hasProduct("product2"));
console.log(getAmount(productsList));
console.log(productsList);