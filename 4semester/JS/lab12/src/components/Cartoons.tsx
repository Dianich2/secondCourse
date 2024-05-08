import { MovieTypeSt } from "../state";
import { MovieCard } from "./MovieCard";

interface CartoonsProps{
    cartoons: MovieTypeSt[];
}


export function Cartoons(props: CartoonsProps){
    const cartoons: JSX.Element[] = [];


    props.cartoons.forEach((cartoon) => {
        if(cartoon.type === 'cartoon'){
            cartoons.push(<MovieCard movie={cartoon}/>);
        }
    })

    return(
        <div>
            {cartoons}
        </div>
    )
}