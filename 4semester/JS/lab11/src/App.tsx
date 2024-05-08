import React from 'react';
import logo from './logo.svg';
import './App.css';
import { FilterableProductTable } from './components/FilterableProductTable';
import { PRODUCTS } from './state';

function App() {
  return (
    <div className="App">
      <FilterableProductTable products={PRODUCTS}/>
    </div>
  );
}

export default App;
