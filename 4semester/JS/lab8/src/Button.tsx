interface ButtonProps {
    title: string;
    handler: () => void;
    disabled: boolean;
}

function Button(props: ButtonProps) {
    return (
        <button disabled={props.disabled} onClick={props.handler}>{props.title}</button>
    );
}

export default Button;
