import { ProductType } from "../state";
import { ProductCategoryRow } from './ProductCategoryRow';
import { ProductRow } from "./ProductRow";
import './productTable.css';

interface ProductTableProps{
    products: ProductType[];
    filterText: string;
    inStockOnly: boolean;
}

export function ProductTable(props: ProductTableProps){
    const filterText: string = props.filterText;
    const inStockOnly: boolean = props.inStockOnly;

    const rows: JSX.Element[] = [];
    let lastCategory : string = '';

    props.products.forEach((product) => {
        if(product.name.toLowerCase().indexOf(filterText) === -1){
            return;
        }
        if(inStockOnly && !product.stocked){
            return;
        }
        if(product.category !== lastCategory){
            rows.push(
                <ProductCategoryRow category={product.category} key={product.category}/>
            );
        }
        rows.push(
            <ProductRow product={product} key={product.name}/>
        )
        lastCategory = product.category;
    })

    return(
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>{rows}</tbody>
        </table>
    )
}