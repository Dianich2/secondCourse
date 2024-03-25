

function transformTelNumberToString(digits: number[]) : string{
    
    if(digits.length != 10){
        return "Incorrect format";
    }
    return "(" + digits[0] + digits[1] + digits[2] + ")" + " " + digits[3] + digits[4] + digits[5] + 
    "-" + digits[6] + digits[7] + digits[8] + digits[9];
}

let res1: string = transformTelNumberToString([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
console.log(res1);



class Challenge{
    static solution(limitNumber: number): number{
        if(limitNumber < 0){
            return 0;
        }
        let sum: number = 0;
        for(let i:number = 1; i < limitNumber; i++){
            if((i % 3 == 0) || (i % 5 == 0)){
                sum += i;
            }
        }
        return sum;
    }
}

let res2: number = Challenge.solution(10);
console.log(res2);



function rotateArray(numbers: number[], k: number): void{
    for(let i: number = 0; i < k; i++){
        let temp: number = numbers[numbers.length - 1];
        numbers.splice(numbers.length - 1, 1);
        numbers.splice(0, 0, temp);
    }
}

let array: number[] = [1, 2, 3, 4, 5, 6, 7];
rotateArray(array, 3);
console.log(array);



function task4(arr1: number[], arr2: number[]): number{

    arr1 = arr1.concat(arr2);
    arr1.sort();
    return getArrayMedian(arr1);

}

function getArrayMedian(arr: number[]): number{

    if(arr.length % 2 == 0){
        return (arr[arr.length / 2] + arr[arr.length / 2 - 1]) / 2;
    }
    else{
        return arr[Math.floor(arr.length / 2)];
    }
}

console.log(task4([1, 3], [2]));
console.log(task4([1, 2], [3, 4]));

