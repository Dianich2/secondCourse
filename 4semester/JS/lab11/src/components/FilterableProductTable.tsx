import { useState } from "react";
import { ProductType } from "../state";
import { ProductTable } from "./ProductTable";
import { SearchBar } from "./SearchBar";


interface FilterableProductTableProps{
    products: ProductType[];
}

export function FilterableProductTable(props: FilterableProductTableProps){

    const[filterText, setFilterText] = useState<string>('');
    const[inStockOnly, setInStockOnly] = useState<boolean>(false);

    const handleFilterTextChange = (filterText: string) =>{
        setFilterText(filterText);
    }

    const handleInStockChange = (inStockOnly: boolean) => {
        setInStockOnly(inStockOnly);
    }

    return(
        <div>
            <SearchBar filterText={filterText} inStockOnly={inStockOnly} 
            onFilterTextChane={handleFilterTextChange} onInStockChange={handleInStockChange}/>
            <ProductTable products={props.products} filterText={filterText} inStockOnly={inStockOnly}/>
        </div>
    ) 
}