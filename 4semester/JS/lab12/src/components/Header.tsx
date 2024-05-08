import { Link, Outlet } from "react-router-dom";
import './css/Header.css'

export function Header(){
    return (
        <>
        <nav>
            <ul className="nav">
            <li><Link to='/Main' className="nav-icon"><span className="icon-home">Home</span></Link></li>
                <li className="el">
                    <Link to='/Movies'>Movies</Link>
                </li>
                <li className="el">
                    <Link to='/Cartoons'>Cartoons</Link>
                </li>
                <li className="el">
                    <Link to='/Series'>Series</Link>
                </li>
            </ul>
        </nav>
        <hr/>
            
        </>
    );
}