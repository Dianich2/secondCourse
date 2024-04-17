import { useState } from "react";
import Button from "./Button";


function Input(){

    const [value, setValue] = useState<string>('');

    const ClearInput = () => {
        setValue('');
    }

    const print = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    }

    return(
        <div>
            <input id="myId" type="text" onChange={print} value={value}></input>
            <Button handler={ClearInput} title="clear" disabled={false}></Button>
        </div>
    );
}

export default Input;