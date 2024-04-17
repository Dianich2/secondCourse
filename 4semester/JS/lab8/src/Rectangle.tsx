import { useState } from "react";
import Button from "./Button";


function Rectangle(){


    const [value, setIsHidden] = useState<boolean>(false);

    const switchVisibility = () =>{
        value === true ? setIsHidden(false) : setIsHidden(true);
    }

    return (
        <div>
            <div style={{border:'1px solid black', backgroundColor:"red" , width:200, height:200, }} hidden={value} onClick={switchVisibility}></div>
        <Button handler={switchVisibility} title="switch" disabled={false}></Button>
        </div>
    )
}

export {Rectangle}