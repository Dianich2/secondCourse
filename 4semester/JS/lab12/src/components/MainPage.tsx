import { Link, Outlet } from "react-router-dom";
import { Header } from "./Header";
import { Footer } from "./Footer";



export function MainPage(){
    return(
        <>
            <Header></Header>
            <Outlet/>
            <Footer></Footer>
        </>
    )
}