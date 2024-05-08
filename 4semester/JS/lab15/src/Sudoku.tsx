import { Cell } from "./Cell";
import React from "react";
import Button from "./Button";
import { Dispatch } from "@reduxjs/toolkit";
import { checkSolution, getAHint, handleCell, SudokuActions} from './actions/actions';

export interface SudocuCell{
    rowIndex: number,
    colIndex: number,
    square: number,
    index: number,
    value: number | null,
    fixed: boolean,
    color: string,
}

export interface SudokuBoard extends Array<Array<SudocuCell>> {}

export interface SudocuProps{
    sudoku: SudokuBoard,
    dispatch: Dispatch<SudokuActions>;
}

const Sudoku: React.FC<SudocuProps> = ({sudoku, dispatch}) => {

    console.log(sudoku);

    const newGame = () =>{
        window.location.reload();
    }

    return(
        <div>
            {sudoku.map((row, rowIndex) => (
                <div key={rowIndex}>
                    {row.map((cell, colIndex) => (
                        <Cell 
                        rowIndex={cell.rowIndex}
                        colIdex={cell.colIndex}
                        square={cell.square}
                        index={cell.index}
                        value={cell.value}
                        Change={ (value: number|null) => dispatch(handleCell(rowIndex, colIndex, cell.square, value))}
                        fixed={cell.fixed}
                        color={cell.color}
                        />
                    ))}
                    <br/>
                </div>
            ))}
            <Button title="New Game" handler={newGame} disabled={false}></Button>
            <Button title="Get A hint" handler={() => dispatch(getAHint())} disabled={false}></Button>
            <Button title="Check solution" handler={() => dispatch(checkSolution())} disabled={false}></Button>
        </div>
    )
}

export default Sudoku;