interface ButtonProps {
    title: string;
    handler: () => void;
    disabled: boolean;
}

function Button(props: ButtonProps) {
    return (
        <button disabled={props.disabled} onClick={props.handler} style={{fontSize:18, marginTop:20, marginLeft: 20}}>{props.title}</button>
    );
}

export default Button;