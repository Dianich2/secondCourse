import React from 'react';
import Todo from './Todo';
import { TodoType } from '../reducers/todos';


interface TodoListProps {
  todos: TodoType[],
  toggleTodo: (id: number) => void;
}

const TodoList: React.FC<TodoListProps> = ({ todos, toggleTodo }) => (
  <ul>
    {
    todos.map((todo) => (
      <Todo
        key={todo.id}
        {...todo}
        onClick={() => toggleTodo(todo.id)}
      />
    ))}
  </ul>
);


export default TodoList;