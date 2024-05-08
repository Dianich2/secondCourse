import { Movie } from "./Movie";
import { MovieType } from '../api/api';
import { MovieCard } from "./MovieCard";
import { MovieTypeSt } from '../state';

type MoviesType = {
    films : MovieType[],
}

function Movies(props: MoviesType){
    const {films = []} = props;
    
    // return <div className="movies">
    //     {films.length ? (films.map(film => (<Movie key={film.imdbID}{...film}/>))):
    //     (<h4>Nothing Found</h4>)}
    // </div>
    return <div className="movies">
        {films.length ? (films.map(film => (<MovieCard movie={{imagesrc: film.Poster, title: film.Title, year: film.Year, type: film.Type}}/>))):
        (<h4 style={{marginLeft: 640, fontSize: 20, marginBottom: 440}}>Nothing Found</h4>)}
    </div>
}

export {Movies}