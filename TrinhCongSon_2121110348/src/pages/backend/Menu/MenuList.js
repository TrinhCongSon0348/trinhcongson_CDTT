import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
// import { urlImage } from '../../../config';
import menuservice from "../../../services/MenuService";

function MenuList() {
    const [menus, setMenus] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await menuservice.getAll()
                .then(function (result) {
                    setMenus(result.data.menus);
                }
                );
        })();
    }, [statusdelete]);
    async function MenuDelete(id){
        await menuservice.remove(id).then(function(result){
            alert(result.data.message);
            setStatusDelete(id);
        })
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH MENU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/menu/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th>Tên sản phẩm</th>
                            <th>Link</th>
                            <th style={{ width: 130 }} className="text-center">Ngày tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {menus.map(function (menu, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td>{menu.name}</td>
                                    <td>{menu.link}</td>
                                    <td className="text-center">10/10/12</td>
                                    <td className="text-center">
                                        <Link to={"/admin/menu/show/"+menu.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/menu/update/"+menu.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>MenuDelete(menu.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{menu.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default MenuList;