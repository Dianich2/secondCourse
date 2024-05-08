import Sudoku from "../Sudoku";
import { connect} from "react-redux";
import { SudokuStateType } from '../reducers/boardReducer';
import { SudokuLibType } from '../reducers/boardReducer';


interface StateProps {
    sudokuState: SudokuStateType,
    sudokuLib: SudokuLibType
}

const mapStateToProps = (state: StateProps) => {
    const { sudokuBoard, wrongRows, wrongCols, wrongSquares } = state.sudokuState;

    const updatedSudokuBoard = [...sudokuBoard];
    updatedSudokuBoard.forEach(row => {
        row.forEach(el => {
            if(wrongSquares.includes(el.square) || wrongRows.includes(el.rowIndex) || wrongCols.includes(el.colIndex))
                el.color = 'red';
            else
                el.color = 'white';
        });
    });

    return { sudoku: updatedSudokuBoard };
};

export default connect(
    mapStateToProps,
)
(Sudoku);
