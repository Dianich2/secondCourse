import { ProductType } from "../state";

interface ProductRowProps{
    product: ProductType;
}

export function ProductRow(props: ProductRowProps){
    const product = props.product;
    const name = product.stocked ? 
        <span style={{color: 'red'}}>
            {product.name}</span>: 
            product.name;

    return(
        <tr>
            <td>{name}</td>
            <td>{product.price}</td>
        </tr>
    )
}