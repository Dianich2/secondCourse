import { useState } from 'react';
import Button from './Button';
import Input from './input';
import { Rectangle } from './Rectangle';


function Counter() {
    const [count, setCount] = useState<number>(0);

    const increase = () => {
        setCount(count + 1);
    };

    const reset = () => {
        setCount(0);
    };


    return (
        <div>
            <h1 style={count === 5 ? { color: 'red' } : {}}>{count}</h1>
            <Button handler={increase} title="increase" disabled={count === 5}/>
            <Button handler={reset} title="reset" disabled={count === 0}/>

            <Input></Input>
            <Rectangle></Rectangle>
        </div>
    );
}

export default Counter;