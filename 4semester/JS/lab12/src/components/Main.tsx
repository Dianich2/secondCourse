import { useEffect, useState } from "react";
import { Movies } from "./Movies";
import { moviesAPI, MovieType } from '../api/api';
import { Search } from "./Search";


function Main(){
    const[movies, setMovies] = useState<MovieType[]>([]);
    const[title, setTttle] = useState('');
    const[type, setType] = useState<string|undefined>('movie');

    const fetchMovies = async (title: string, type: string|undefined) => { 
        const response = await moviesAPI.getMovies(title, type);
        setMovies(response);
    }

    // useEffect(() =>  {
    //     fetchMovies(title, type)
    // });

    return <>
        <main className="container content">
        <Search serachMovies={fetchMovies}/>

        <h1 style={{marginLeft:600}}>Каталог фильмов</h1>
        <Movies films={movies}></Movies>
        </main>
    </>
}

export {Main}