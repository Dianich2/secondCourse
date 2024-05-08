import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { MainPage } from './components/MainPage';
import { MoviesSt } from './components/MoviesSt';
import { Cartoons } from './components/Cartoons';
import { Series } from './components/Series';
import { Header } from './components/Header';
import { MOVIES } from './state';
import { Main } from './components/Main';

function App() {
  return (

    <BrowserRouter>
      <Routes>
        <Route path='/' element={<MainPage/>}>
        <Route path='Main' element={<Main/>}></Route>
        <Route path='Movies' element={<MoviesSt movies={MOVIES}/>}></Route>
        <Route path='Cartoons' element={<Cartoons cartoons={MOVIES}/>}></Route>
        <Route path='Series' element={<Series series={MOVIES}/>}></Route>
        </Route>
      </Routes>
      
    </BrowserRouter>
  );
}

export default App;
