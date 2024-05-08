import React from 'react';
import Sudoku from './Sudoku';
import SudokuContainer from './containers/SudokuContainer';

function App() {
  return (
    <div className="App">
      <h1>Sudoku</h1>
      <SudokuContainer></SudokuContainer>
    </div>
  );
}

export default App;
