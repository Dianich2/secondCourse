const API_KEY = process.env.REACT_APP_API_KEY;

export const moviesAPI = {
    getMovies(title: string, type: string|undefined){
        return fetch(`http://www.omdbapi.com/?apikey=aa6afa52&s=${title}&type=${type}`)
            .then(response => response.json())
            .then(data => data.Search)
        //return instance.get<MovieType[]>(`?type=${type}&s=${title}`)
    },
}
    
export type MovieType = {
    Title: string,
    Year: string,
    imdbID: string,
    Type: string,
    Poster: string
}
