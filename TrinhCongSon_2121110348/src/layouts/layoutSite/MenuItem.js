import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import menuservice from "../../services/MenuService";

function MenuItem(props) {
    const rowmenu = props.menu;
    const [menus, setMenus] = useState([]);
    useEffect(function () {
        (async function () {
            await menuservice.getByParentId('mainmenu', rowmenu.id)
                .then(function (result) {
                    setMenus(result.data.menus);
                }
                );
        })();
    }, []);
    if (menus == null) {
        return (
            <li className="nav-item">
                <Link className="nav-link text-white" to={rowmenu.link}>{rowmenu.name}</Link>
            </li>
        )
    }
    else {
        return (
            // <li className="nav-item dropdown">
            //     <a className="nav-link dropdown-toggle text-white" to={rowmenu.link} role="button" data-bs-toggle="dropdown" aria-expanded="false">
            //     {rowmenu.name}
            //     </a>
            //     <ul className="dropdown-menu">
            //       <li><Link className="dropdown-item" href="#">Action</Link></li>
            //       <li><Link className="dropdown-item" href="#">Another action</Link></li>
            //       <li><Link className="dropdown-item" href="#">Something else here</Link></li>
            //     </ul>
            //   </li>

            <li className="nav-item dropdown">
                <Link className="nav-link dropdown-toggle text-white" to={rowmenu.link} role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    {rowmenu.name}
                </Link>
                <ul className="dropdown-menu">
                    {menus.map(function (menu1, index) {
                        return <li key={index}>
                            <Link className="dropdown-item" to={menu1.link}>{menu1.name}</Link>
                        </li>
                    })}
                    {/* <li><Link className="dropdown-item" to="/">Action</Link></li>
                    <li><Link className="dropdown-item" to="/">Another action</Link></li>
                    <li><Link className="dropdown-item" to="/">Something else here</Link></li> */}
                </ul>
            </li>
        );
    }
}

export default MenuItem;