import { useEffect, useState } from "react";
import { moviesAPI, MovieType } from "./api/api";
import { Movies } from "./Movies";
import { Search } from "./Search";


function Main(){
    const[movies, setMovies] = useState<MovieType[]>([]);
    const[title, setTttle] = useState('');
    const[type, setType] = useState('movie');

    const fetchMovies = async (title: string, type: string) => { 
        const response = await moviesAPI.getMovies(title, type);
        setMovies(response);
    }

    // useEffect(() =>  {
    //     fetchMovies(title, type)
    // });

    return <>
        <main className="container content">

        <Search searchMovies={fetchMovies}/>


        <h1>Каталог фильмов</h1>
        <Movies films={movies}></Movies>
        </main>
    </>
}

export {Main}