
array = [1, [1, 2, [3, 4]], [2, 4]];

resultFrray = array.reduce((accumulator, currentValue) => {
  if (Array.isArray(currentValue)) {
    return accumulator.concat(...currentValue);
  } else {
    return accumulator.concat(currentValue);
  }
}, []);

console.log(resultFrray);