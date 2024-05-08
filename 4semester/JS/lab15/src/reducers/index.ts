import { combineReducers } from "@reduxjs/toolkit";
import boardReducer from "./boardReducer";


export default combineReducers({
    sudokuState: boardReducer,
});