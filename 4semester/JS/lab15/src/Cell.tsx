import { useState } from "react";

interface CellProps{
    rowIndex: number,
    colIdex: number,
    square: number,
    index: number,
    value: number | null
    Change: (value: number|null) => void; 
    fixed: boolean,
    color: string,
}

function Cell(props: CellProps){
    const [value, setValue] = useState<string>(props.value !== null ? props.value.toString() : '');


    const print = (e: React.ChangeEvent<HTMLInputElement>) => {
        const inputValue = e.target.value;
        const isValidInput = /^[1-9]$/.test(inputValue);

        if(inputValue.length === 0 || (inputValue.length === 1 && isValidInput)){
        setValue(e.target.value);
        props.Change(inputValue.length === 0 ? null : parseInt(e.target.value, 10));
        }
    }

    return (
        <input type="text"
        value={props.value !== null ? props.value.toString() : value}
        onChange={print} 
        style={{width: 40, height:40, fontSize:45, textAlign:'center', background:props.color, zIndex:3}} 
        maxLength={1}
        readOnly={props.fixed}/>
    );
}

export {Cell}