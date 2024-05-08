import {TodoActionTypes } from "../actions";

const todos = (state: TodoType[] = [], action: TodoActionTypes) => {
    switch (action.type) {
      case 'ADD_TODO':
        return [
          ...state,
          {
            id: action.id,
            text: action.text,
            completed: false,
          },
        ];
      case 'TOGGLE_TODO':
        return state.map((todo) =>
          todo.id === action.id
            ? { ...todo, completed: !todo.completed }
            : todo
        );
      default:
        return state;
    }
  };

  export type TodoType = {
    id: number;
    text: string;
    completed: boolean;
  }
  
  export default todos;