import { MovieType } from '../api/api';


function Movie(props: MovieType){
    const {
        Title: title,
        Year: year,
        imdbID: id,
        Type: type,
        Poster: poster,
    } = props

    return <>
    <div id={id} className="card small">
        <div className="card-image">
            <img className="activator" src={poster}/>
        </div>
        <div className="class-content">
            <span>{title}</span>
            <p>
                <span>{type}</span>
            </p>
        </div>
        </div>
    </>
}

export {Movie}