import React from 'react';

interface linkProps{
  active: boolean,
  children: React.ReactNode,
  onClick: () => void,
}


const Link: React.FC<linkProps> = ({ active, children, onClick }) => (
  <button
    onClick={onClick}
    disabled={active}
    style={{
      marginLeft: '4px',
    }}
  >
    {children}
  </button>
);

export default Link;