
array = [1, [1, 2, [3, 4]], [2, 4]];

resultArray = array.reduce((accumulator, currentValue) => {
  if (Array.isArray(currentValue)) {
    return accumulator.concat(...currentValue);
  } else {
    return accumulator.concat(currentValue);
  }
}, []);

sum = resultArray.reduce((accumulator, currentValue) => {
    return accumulator+currentValue;
}, 0);
console.log(sum);