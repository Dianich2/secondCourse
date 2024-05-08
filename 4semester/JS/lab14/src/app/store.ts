import rootReducer from '../reducers';
import { createStore } from "@reduxjs/toolkit";

export const store = createStore(rootReducer);
