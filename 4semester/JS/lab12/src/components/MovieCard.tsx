import { MovieTypeSt } from '../state';
import './css/MovieCard.css';

interface MovesCardProps{
    movie: MovieTypeSt;
}

export function MovieCard(props: MovesCardProps){
    const movie = props.movie;
    return(
        <div className='card'>
            <img src={movie.imagesrc}></img>
            <p className='info'>
                <p id='title'>{movie.title}</p>
                <p style={{fontSize: 18}}>
                    <span>{movie.year}</span>
                    <span style={{marginLeft:200}}>{movie.type}</span>
                </p>
            </p>
        </div>
        
    )

}