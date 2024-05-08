import { ChangeEvent, useState } from "react";
import './css/Search.css'

interface SearchProps{
    serachMovies: (search: string, type:string|undefined) => void;
}


export function Search(props : SearchProps){

    const searchMovies = props.serachMovies;

    const [serach, setSearch] = useState<string>('');
    const [type, setType] = useState<string|undefined>('');

    const handleKey = (event: React.KeyboardEvent) : void =>{
        if(event.key === 'Enter'){
            searchMovies(serach, type);
        }
    }


    const handleFilter = (event: ChangeEvent<HTMLInputElement>) : void =>{
        setType(event.target.dataset.type);
        searchMovies(serach, event.target.dataset.type);
    }

    return(
        <div className="row">
            <div className="input-field">
                <input
                placeholder="search"
                className="searchInput"
                value={serach}
                onChange={(e:ChangeEvent<HTMLInputElement>) : void => setSearch(e.target.value)}
                onKeyDown={handleKey}
                />
                <button className="btn-search-btn"  
                    onClick={(): void => {searchMovies(serach, type)}}>Search
                </button>

                <div style={{marginTop: 10, fontSize: 16}}> 
                    <label className="movies-type">
                        <input className="with-gap" name="type" type="radio" data-type=''
                        onChange={handleFilter} checked={type===''}/>
                    <span>All</span>

                    </label>
                    <label className="movies-type">
                    <input className="with-gap" name="type" type="radio" data-type='movie'
                        onChange={handleFilter} checked={type==='movie'}/>
                    <span>Movies only</span>

                    </label>
                    <label className="moveis-type">
                    <input className="with-gap" name="type" type="radio" data-type='series'
                        onChange={handleFilter} checked={type==='series'}/>
                    <span>Series only</span>

                    </label>
                </div>
            </div>
        </div>
    )
}