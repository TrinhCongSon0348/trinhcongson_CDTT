// // import { Outlet } from "react-router-dom";
// import Header from "../../../layouts/layoutSite/Header";
// // import Menu from "../../../layouts/layoutSite/Menu";
// // import Footer from "../../../layouts/layoutSite/Footer";
// import Copyright from "../../../layouts/layoutSite/Copyright";
// import Navbar from "../../../component/Navbar";
// import CartList from "../../../component/CartList";
// import FooterCart from "../../../component/FooterCart";
// import {useState} from 'react';
// import cartList from '../../../datatest/cart';
// // import GioHang from "../../frontend/GioHang/index";
// // import 'bootstrap/dist/css/bootstrap.min.css';
// // import 'bootstrap/dist/js/bootstrap.bundle.min.js';

// function GioHang() {
//     const {carts, setCarts}=useState(cartList);

//     console.log(carts);

//     function cartartTotal()
//     {
//         let cartTotal=0;
//         for(let i=0;i<carts?.length;i++){
//             cartTotal=cartTotal + carts[i].amount;
//         }
//         return cartTotal;
//     }

//     function cartAmount()
//     {
//         let cartAmount=0;
//         for(let i=0;i<carts?.length;i++){
//             cartAmount=cartAmount + carts[i].amount * carts[i].price;
//         }
//         return cartAmount;
//     }

//     const handleClickRemove=(id) =>{
//         const newStateCart=carts.filter(function(cartItem)
//         {
//             if(cartItem.id !=id)
//             {
//                 return true;
//             }
//             console.log("cartItem", cartItem);
//         }
//         );
//         setCarts(newStateCart);
//         // console.log("newStateCart", newStateCart);
//     }
//     if(carts?.length===0)
//     {
//         return(
//             <div className="cart">
//                 <header>
//                     <h2>Your bag</h2>
//                     <h4 className="empty-cart">is current empty</h4>
//                 </header>
//             </div>
//         )
//     }
//     return (
//         <>
//             <Header/>
//             <Navbar cartartTotal={cartartTotal()}/>
//             <CartList carts={carts} onClickRemove={handleClickRemove}/>
//             <FooterCart cartAmount={cartAmount()}/>
//             {/* <Menu/> */}
//             {/* <Footer/> */}
//             <Copyright/>
//         </>
//     );
// }

// export default GioHang;

//Cach 2
// import { Outlet } from "react-router-dom";
import Header from "../../../layouts/layoutSite/Header";
// import Menu from "../../../layouts/layoutSite/Menu";
// import Footer from "../../../layouts/layoutSite/Footer";
// import Copyright from "../../../layouts/layoutSite/Copyright";
// import Navbar from "../../../component/Navbar";
// import CartList from "../../../component/CartList";
// import FooterCart from "../../../component/FooterCart";
// import {useState} from 'react';
// import cartList from '../../../datatest/cart';
// import GioHang from "../../frontend/GioHang/index";
// import 'bootstrap/dist/css/bootstrap.min.css';
// import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import Shop from "../../../component/Shop";
import Giohang from "../../../component/Giohang";
// import Header from "../../../component/Header";

function GioHang()
{
    return(
        <>
            {/* <Header/> */}
            <Shop/>
            <Giohang/>
        </>
    );
}
export default GioHang;