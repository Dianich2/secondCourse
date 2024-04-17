import { MovieType } from "./api/api"
import { Movie } from "./Movie";

type MoviesType = {
    films : MovieType[],
}

function Movies(props: MoviesType){
    const {films = []} = props;
    
    return <div className="movies">
        {films.length ? (films.map(film => (<Movie key={film.imdbID}{...film}/>))):
        (<h4>Nothing Found</h4>)}
    </div>
}

export {Movies}