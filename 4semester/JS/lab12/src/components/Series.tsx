import { MovieTypeSt } from "../state"
import { MovieCard } from "./MovieCard";

interface SeriesProps{
    series: MovieTypeSt[];
}

export function Series(props: SeriesProps){
    const series: JSX.Element[] = [];


    props.series.forEach((serial) => {
        if(serial.type === 'serial'){
            series.push(<MovieCard movie={serial}/>);
        }
    })

    return(
        <div>
            {series}
        </div>
    )
}