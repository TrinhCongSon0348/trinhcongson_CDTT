import Contact from "../pages/frontend/Contact";
import Home from "../pages/frontend/Home";
import Product from "../pages/frontend/Product";
import ProductDetail from "../pages/frontend/Product/ProductDetail";
import ProductBrand from "../pages/frontend/ProductBrand";
import ProductCategory from "../pages/frontend/ProductCategory";
import GioiThieu from "../pages/frontend/GioiThieu";
import ChinhSachMuaHang from "../pages/frontend/ChinhSachMuaHang";
import ChinhSachVanChuyen from "../pages/frontend/ChinhSachVanChuyen";
import ChinhSachDoiTra from "../pages/frontend/ChinhSachDoiTra";
import ChinhSachBaoHanh from "../pages/frontend/ChinhSachBaoHanh";
import GioHang from "../pages/frontend/GioHang";
import DangKyTaiKhoan from "../pages/frontend/DangKyTaiKhoan";
import DangNhap from "../pages/frontend/DangNhap";
import BaiViet from "../pages/frontend/BaiViet";
import PostTopic from "../pages/frontend/PostTopic";
import PostDetail from "../pages/frontend/BaiViet/PostDetail";
import PostNew from "../pages/frontend/PostNew";

const RouterPublic=[
    {path:"/", component:Home},
    {path:"/san-pham", component:Product},
    {path:"/gioi-thieu", component:GioiThieu},
    {path:"/chinh-sach-mua-hang", component:ChinhSachMuaHang},
    {path:"/chinh-sach-van-chuyen", component:ChinhSachVanChuyen},
    {path:"/chinh-sach-doi-tra", component:ChinhSachDoiTra},
    {path:"/chinh-sach-bao-hanh", component:ChinhSachBaoHanh},
    {path:"/chi-tiet-san-pham/:slug", component:ProductDetail},
    {path:"/danh-muc-san-pham/:slug", component:ProductCategory},
    {path:"/thuong-hieu-san-pham/:slug", component:ProductBrand},
    {path:"/lien-he",component:Contact},
    {path:"/gio-hang/:id",component:GioHang},
    {path:"/dang-ky",component:DangKyTaiKhoan},
    {path:"/dang-nhap",component:DangNhap},
    {path:"/tat-ca-bai-viet",component:BaiViet},
    {path:"/bai-viet-theo-chu-de/:slug",component:PostTopic},
    {path:"/chi-tiet-bai-viet/:slug",component:PostDetail},
    {path:"/bai-viet-moi-nhat",component:PostNew},
]
export default RouterPublic;