import { useState } from "react";

interface CellProps{
    rowIndex: number,
    colIdex: number,
    index: number,
    value: number | null
    Change: (rowIndex: number, colIndex:number, newValue:number | null)=> void,
    fixed: boolean,
    color: string,
}

function Cell(props: CellProps){
    const [value, setValue] = useState<string>('');


    const print = (e: React.ChangeEvent<HTMLInputElement>) => {
        const inputValue = e.target.value;
        const isValidInput = /^[1-9]$/.test(inputValue);

        if(inputValue.length === 0 || (inputValue.length === 1 && isValidInput)){
        setValue(e.target.value);
        props.Change(props.rowIndex, props.colIdex, 
        inputValue.length === 0 ? null : parseInt(e.target.value, 10));
        }
    }

    return (
        <input type="text" 
        value={props.value !== null ? props.value : value}
        onChange={print} 
        style={{width: 40, height:40, fontSize:45, textAlign:'center', background:props.color, zIndex:3}} 
        maxLength={1}
        readOnly={props.fixed}/>
    );
}

export {Cell}