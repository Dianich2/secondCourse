import { MovieTypeSt } from "../state"
import { MovieCard } from "./MovieCard";

interface MoviesProps{
    movies: MovieTypeSt[]
}

export function MoviesSt(props: MoviesProps){

    const movies: JSX.Element[] = [];


    props.movies.forEach((movie) => {
        if(movie.type === 'movie'){
            movies.push(<MovieCard movie={movie}/>);
        }
    })

    return(
        <div>
            {movies}
        </div>
    )
}