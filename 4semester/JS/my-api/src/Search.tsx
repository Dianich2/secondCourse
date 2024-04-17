import { ChangeEvent, useState } from "react";


//@ts-ignore
export function Search(props){

    const {searchMovies = Function.prototype} = props;

    const [serach, setSearch] = useState<string>('');
    const [type, setType] = useState<String>('');

    //@ts-ignore
    const handleKey = (event) : void =>{
        if(event.key === 'Enter'){
            searchMovies(serach, type);
        }
    }

    //@ts-ignore
    const handleFilter = (event) : void =>{
        setType(event.target.dataset.type);
        searchMovies(serach, event.target.dataset.type);
    }

    return(
        <div className="row">
            <div className="input-field">
                <input
                placeholder="search"
                className="validate"
                value={serach}
                onChange={(e:ChangeEvent<HTMLInputElement>) : void => setSearch(e.target.value)}
                onKeyDown={handleKey}
                />
                <button className="btn-search-btn"
                    onClick={(): void => {searchMovies(serach, type)}}>Search
                </button>

                <div>
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