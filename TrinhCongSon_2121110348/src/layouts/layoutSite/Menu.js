import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import menuservice from "../../services/MenuService";
import MenuItem from "./MenuItem";

function Menu() {
  const [menus, setMenus] = useState([]);
  useEffect(function () {
    (async function () {
      await menuservice.getByParentId('mainmenu', 0)
        .then(function (result) {
          setMenus(result.data.menus);
        }
        );
    })();
  }, []);
  return (<section className="mainmenu">
    <div className="container">
      <nav className="navbar bg-dark navbar-expand-lg" data-bs-theme="dark">
        <div className="container-fluid">
          <Link className="navbar-brand text-white d-md-none d-sm-block" href="#">Shop siêu xe</Link>
          <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              {menus.map(function (menu, index) {
                return <MenuItem key={index} menu={menu} />;
              })}
              {/* <li className="nav-item dropdown">
                <a className="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Dropdown
                </a>
                <ul className="dropdown-menu">
                  <li><Link className="dropdown-item" href="#">Action</Link></li>
                  <li><Link className="dropdown-item" href="#">Another action</Link></li>
                  <li><Link className="dropdown-item" href="#">Something else here</Link></li>
                </ul>
              </li> */}
            </ul>
            
          </div>
        </div>
      </nav>
    </div>

  </section>);
}

export default Menu;

// import { Link } from "react-router-dom";
// import menu from "../../datatest/menu.json";
// function Menu() {
//     const listMenu=menu.data;
//     return ( <section className="mainmenu">
//         <div className="container">
//         <nav className="navbar bg-dark navbar-expand-lg" data-bs-theme="dark">
//   <div className="container-fluid">
//     <Link className="navbar-brand text-white d-md-none" href="#">Navbar</Link>
//     <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
//       <span className="navbar-toggler-icon"></span>
//     </button>
    {/* <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> */}
//     <div className="collapse navbar-collapse" id="navbarSupportedContent">
//       <ul className="navbar-nav me-auto mb-2 mb-lg-0">
//         {listMenu.map(function(menu,index){
//           return(
//             <li className="nav-item" key={index}>
//               <Link className="nav-link active text-white" aria-current="page" to={menu.link}>
//                 {menu.name}
//               </Link>
//             </li>
//           )
//         })}
//       </ul>
//     </div>
    
//   </div>
// </nav>
//         </div>

//     </section>);
// }

// export default Menu;