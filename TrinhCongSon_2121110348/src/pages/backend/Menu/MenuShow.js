import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import menuservice from "../../../services/MenuService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function MenuShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [menu, setMenu] = useState([]);
    useEffect(function () {
        (async function () {
            await menuservice.getById(id)
            .then(function (result) {
                setMenu(result.data.menu);
            }
            );
        })();
    }, []);
    async function MenuDelete(id){
        await menuservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/menu", { replace: true })
        }
        );
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-6">
                        <strong className="text-danger text-uppercase">CHI TIẾT DANH MỤC</strong>
                    </div>
                    <div className="col-6 text-end">
                        <Link to="/admin/menu" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/menu/update/"+menu.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>MenuDelete(menu.id)} className="btn btn-sm btn-danger">
                        <FaTrash />Xoa
                    </button>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-bordered">
                    <thead>
                        <tr>
                            <th style={{ width: 200 }}>Ten truong</th>
                            <th>Gia tri</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Id</th>
                            <td>{menu.id}</td>
                        </tr>
                        <tr>
                            <th>Ten san pham</th>
                            <td>{menu.name}</td>
                        </tr>
                        <tr>
                            <th>Slug</th>
                            <td>{menu.link}</td>
                        </tr>
                        <tr>
                            <th>Thu tu</th>
                            <td>{menu.sort_order}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default MenuShow;