var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
console.log("\n\n\n");
var prod = {
    shoes: {
        boots: [
            { id: 1, size: 41, color: "Red", price: 120 },
            { id: 2, size: 42, color: "Blue", price: 110 },
            { id: 3, size: 43, color: "Black", price: 130 }
        ],
        sneakers: [
            { id: 4, size: 41, color: "Black", price: 140 },
            { id: 5, size: 42, color: "Red", price: 115 },
            { id: 6, size: 43, color: "Blue", price: 145 }
        ],
        sandals: [
            { id: 7, size: 41, color: "Blue", price: 125 },
            { id: 8, size: 42, color: "Black", price: 105 },
            { id: 9, size: 43, color: "Red", price: 135 }
        ]
    }
};
function custumFilter(pr, more, less, size, color) {
    var result = [];
    var items = Object["values"](pr.shoes).reduce(function (acc, curr) { return acc.concat(curr); }, []);
    items.forEach(function (item) {
        if ((item.size == size || size == undefined)
            && (item.color == color || color == undefined)
            && (item.price >= more || more == undefined)
            && (item.price <= less || less == undefined)) {
            result = __spreadArray(__spreadArray([], result, true), [item], false);
        }
        ;
    });
    return result;
}
var filteredShoue = custumFilter(prod, 125, 140, 41, "Black");
console.log("-------------------------------------");
console.log(filteredShoue);
console.log("--------------------------------------");
console.log("");
var ProductIterator = /** @class */ (function () {
    function ProductIterator(pr) {
        this.index = 0;
        this.allShoes = Object["values"](pr.shoes).reduce(function (acc, curr) { return acc.concat(curr); }, []);
    }
    ProductIterator.prototype.next = function () {
        if (this.index < this.allShoes.length)
            return this.allShoes[this.index++];
        else
            return null;
    };
    return ProductIterator;
}());
var iterator = new ProductIterator(prod);
var p = iterator.next();
console.log("-------------------------------------");
while (p != null) {
    console.log(p);
    p = iterator.next();
}
console.log("-------------------------------------");
console.log("");
var ShoeClass = /** @class */ (function () {
    function ShoeClass(id, size, color, price, discount) {
        this.id = id;
        this.size = size;
        this.color = color;
        this.price = price;
        this.discount = discount;
        this.finlaPrice = this.price * (1 - this.discount / 100);
    }
    ShoeClass.prototype.getFinalPrice = function () {
        return this.finlaPrice;
    };
    ShoeClass.prototype.setDiscount = function (discount) {
        this.discount = discount;
        this.finlaPrice = this.price * (1 - this.discount / 100);
    };
    return ShoeClass;
}());
var allProducts2 = {
    shoes: {
        boots: [
            new ShoeClass(1, 41, "Red", 120, 10),
            new ShoeClass(2, 42, "Blue", 110, 15),
            new ShoeClass(3, 43, "Black", 130, 11)
        ],
        sneakers: [
            new ShoeClass(4, 41, "Black", 140, 12),
            new ShoeClass(5, 42, "Red", 115, 13),
            new ShoeClass(6, 43, "Blue", 145, 15)
        ],
        sandals: [
            new ShoeClass(7, 41, "Blue", 125, 20),
            new ShoeClass(8, 42, "Black", 105, 16),
            new ShoeClass(9, 43, "Red", 135, 17)
        ]
    }
};
console.log("-------------------------------------");
console.log(allProducts2);
allProducts2.shoes.boots[0].setDiscount(90);
var finPrice = allProducts2.shoes.boots[0].getFinalPrice();
console.log(finPrice);
console.log("-------------------------------------");
console.log("");
