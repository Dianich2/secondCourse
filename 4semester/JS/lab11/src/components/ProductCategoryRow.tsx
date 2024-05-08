
interface ProductCategoryRowProps{
    category: string;
}

export function ProductCategoryRow(props : ProductCategoryRowProps){
    const category: string = props.category;
    return(
        <tr>
            <th colSpan={2}>{category}</th>
        </tr>
    );
}