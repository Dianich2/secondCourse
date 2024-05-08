import React from 'react';

interface todoProps{
  onClick: () => void,
  completed: boolean,
  text: string;
}


const Todo: React.FC<todoProps> = ({ onClick, completed, text }) => (
  <li
    onClick={onClick}
    style={{
      textDecoration: completed ? 'line-through' : 'none',
    }}
  >
    {text}
  </li>
);


export default Todo;