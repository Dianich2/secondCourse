import { getSudoku } from "sudoku-gen";
import { SudokuActions } from "../actions/actions";
import { SudokuBoard, SudocuCell } from '../Sudoku';


const initiateSudokuBoard = (sudokuLib: SudokuLibType) => {
    const initialSudoku: SudokuBoard = [];

    let i : number = 0;
    for(let j = 0; j < 9; j++){

        let row: SudocuCell[] = [];

        for(let k = 0; k < 9; k++){

            const square = (Math.floor(j / 3) * 3) + Math.floor(k / 3) + 1;

            row.push({
                rowIndex: j,
                colIndex: k,
                square: square,
                index: i, 
                value: sudokuLib.puzzle.charAt(i) === '-' ? null : parseInt(sudokuLib.puzzle.charAt(i), 10),
                fixed: sudokuLib.puzzle.charAt(i) === '-' ? false : true, 
                color:'white'});
            i++;
        }
        initialSudoku.push(row);
    }
    return initialSudoku;
}

export interface SudokuLibType{
    puzzle: string;
    solution: string;
    difficulty: string;
}

export interface SudokuStateType{
    sudokuLib: SudokuLibType,
    sudokuBoard: SudokuBoard;
    wrongCols: number[];
    wrongRows: number[];
    wrongSquares: number[];
}

const lib: SudokuLibType = getSudoku('easy');

const defaultState: SudokuStateType = {
    sudokuLib: lib,
    sudokuBoard: initiateSudokuBoard(lib),
    wrongCols: [],
    wrongRows: [],
    wrongSquares: [],
}


const boardReducer = (sudokuState: SudokuStateType = defaultState, action: SudokuActions): SudokuStateType => {
    console.log(sudokuState.sudokuLib.solution);

    switch (action.type) {
        case 'HANDLE_CELL': {
            const { rowIndex, colIndex, square, newValue } = action;
            const newBoard: SudokuBoard = sudokuState.sudokuBoard.map((row, rIndex) => {
                if (rIndex === rowIndex) {
                    return row.map((cell, cIndex) => {
                        if (cIndex === colIndex) {
                            console.log(cell.square);
                            return { ...cell, value: newValue };
                        }
                        return cell;
                    });
                }
                return [...row];
            });

            const newWrongCols = [...sudokuState.wrongCols];
            const newWrongRows = [...sudokuState.wrongRows];
            const newWrongSqueres = [...sudokuState.wrongSquares];

            if (!colValid(newBoard, rowIndex, colIndex)) {
                if (!newWrongCols.includes(colIndex)) {
                    newWrongCols.push(colIndex);
                }
            } else {
                const index = newWrongCols.indexOf(colIndex);
                if (index !== -1) {
                    newWrongCols.splice(index, 1);
                }
            }

            if (!rowValid(newBoard, rowIndex, colIndex)) {
                if (!newWrongRows.includes(rowIndex)) {
                    newWrongRows.push(rowIndex);
                }
            } else {
                const index = newWrongRows.indexOf(rowIndex);
                if (index !== -1) {
                    newWrongRows.splice(index, 1);
                }
            }

            if (!squareValid(newBoard, rowIndex, colIndex, square)) {
                if (!newWrongSqueres.includes(square)) {
                    newWrongSqueres.push(square);
                }
            } else {
                const index = newWrongSqueres.indexOf(square);
                if (index !== -1) {
                    newWrongSqueres.splice(index, 1);
                }
            }

            console.log(newWrongRows);
            console.log(newWrongCols);
            console.log(newWrongSqueres);
            return {
                ...sudokuState,
                sudokuBoard: newBoard,
                wrongCols: newWrongCols,
                wrongRows: newWrongRows,
                wrongSquares: newWrongSqueres
            };
        }
        case 'GET_A_HINT':{
            const updatedSudoku = [...sudokuState.sudokuBoard];
            let hintFound = false;

            for(let row = 0; row < 9; row++){
              for(let col = 0; col < 9; col++){
                    if(updatedSudoku[row][col].value == null){
                        updatedSudoku[row][col].value = parseInt(sudokuState.sudokuLib.solution.charAt(updatedSudoku[row][col].index),10)
                        console.log(updatedSudoku[row][col]);
                        hintFound = true;
                        break;
                    }
                }
                if (hintFound) {
                    break;
                }
            }
            return{
                ...sudokuState,
                sudokuBoard: updatedSudoku
            }
        }
        case 'CHECK_SOLUTION':{
            const newWrongSqueres = [...sudokuState.wrongSquares];

            if(!solved(sudokuState.sudokuBoard, sudokuState.sudokuLib)){
                for(let sq = 0; sq < 9; sq++){
                    newWrongSqueres.push(sq+1);
                }
            }
            return{
                ...sudokuState,
                wrongSquares: newWrongSqueres
            }
        }
        default:
            return sudokuState;
    }
};

const colValid = (sudokuBoard: SudokuBoard, rowIndex: number, colIndex: number): boolean => {
    const targetValue = sudokuBoard[rowIndex][colIndex].value;
    if(targetValue === null) return true;

    for (let row = 0; row < 9; row++) {
        if (row !== rowIndex && sudokuBoard[row][colIndex].value === targetValue) {
            return false;
        }
    }
    return true;
};

const rowValid = (sudokuBoard: SudokuBoard, rowIndex: number, colIndex: number): boolean => {
    const targetValue = sudokuBoard[rowIndex][colIndex].value;
    if(targetValue === null) return true;

    for (let col = 0; col < 9; col++) {
        if (col !== colIndex && sudokuBoard[rowIndex][col].value === targetValue) {
            return false;
        }
    }
    return true;
};

const squareValid = (sudokuBoard: SudokuBoard, rowIndex: number, colIndex: number, square: number): boolean => {
    const targetValue = sudokuBoard[rowIndex][colIndex].value;
    if(targetValue === null) return true;
    
    let startRow = Math.floor(rowIndex/3) * 3;
        let startCol = Math.floor(colIndex/3) * 3;

        for(let row = startRow; row < startRow + 3; row++){
            for(let col = startCol; col < startCol + 3; col++){
                if((row !== rowIndex || col !== colIndex) && sudokuBoard[row][col].value === targetValue){
                    return false;
                }
            }
        }
        return true;
};

const solved = (sudokuBoard: SudokuBoard, sudokuLib: SudokuLibType): boolean => {
    console.log('here');
    for(let row = 0; row < 9; row++){
        for(let col = 0; col < 9; col++){
              if(sudokuBoard[row][col].value !== parseInt(sudokuLib.solution.charAt(sudokuBoard[row][col].index),10))
                return false;
          }
      }
      return true;
}

export default boardReducer