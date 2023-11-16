import { Outlet } from "react-router-dom";
import Header from "./Header";
import Menu from "./Menu";
import Footer from "./Footer";
import Copyright from "./Copyright";
// import Tim from "../../Search/Tim";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

function LayoutSite() {
    return (
        <>
            <Header/>
            {/* <Tim/> */}
            <Menu/>
            <Outlet/>
            <Footer/>
            <Copyright/>
        </>
    );
}

export default LayoutSite;