import './SearchBar.css';


interface SearchBarProps{
    filterText: string;
    inStockOnly: boolean;
    onFilterTextChane: (filterText: string) => void;
    onInStockChange: (isOntock: boolean) => void;
}

export function SearchBar(props : SearchBarProps){

    const handleFilterTextChange = (e : React.ChangeEvent<HTMLInputElement>) =>{
        props.onFilterTextChane(e.target.value);
    }
    const handleInStockChange = (e : React.ChangeEvent<HTMLInputElement>) =>{
        props.onInStockChange(e.target.checked);
    }

    return(
        <form>
            <input className='searchInput' type="text" placeholder='Search...' value={props.filterText} onChange={handleFilterTextChange} />
            <p>
                <label>
                <input type="checkbox" checked={props.inStockOnly} onChange={handleInStockChange}/>
                {' '}
                Only show products in stock</label>
            </p>
        </form>
    );
}