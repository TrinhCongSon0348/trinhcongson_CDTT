import Logo from '../../assets/images/Logo.png';
import { Link } from "react-router-dom";
// import Cart from './Cart';

function Header() {
    return (<section className="Header">
        <div className="container">
            <div className="row">
                <div className="col-md-4">
                    <img src={Logo} alt="" className="img-fluid" style={{ width: 200 }} />
                </div>
                <div className="col-md-3">
                    TÌM KIẾM
                </div>
                <div className="col-md-2" >
                    <Link className="dropdown-item" to="/dang-nhap">Đăng Nhập</Link></div>
                <div className="col-md-2" >
                    <Link className="dropdown-item" to="/dang-ky">Đăng Ký</Link></div>
                <div className="col-md-1">
                    <Link className="dropdown-item" to="/gio-hang">Giỏ Hàng
                    <i class="fa fa-shopping-bag" aria-hidden="true"></i></Link>
                </div>
            </div>
        </div>
    </section>);
}

export default Header;