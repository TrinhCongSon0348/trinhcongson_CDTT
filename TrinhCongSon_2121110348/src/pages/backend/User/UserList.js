import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
import { urlImage } from '../../../config';
import userservice from "../../../services/UserService";

function UserList() {
    const [users, setUsers] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await userservice.getAll()
                .then(function (result) {
                    setUsers(result.data.users);
                }
                );
        })();
    }, [statusdelete]);
    function UserDelete(id){
        userservice.remove(id).then(function(result){
            alert(result.data.message);
            setStatusDelete(id);
        })
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH MỤC SẢN PHẨM</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/user/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th style={{ width: 120 }} className="text-center">Hình</th>
                            <th>Tên người dùng</th>
                            <th>Slug</th>
                            <th style={{ width: 130 }} className="text-center">Ngày tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {users.map(function (user, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td className="text-center">
                                        <img src={urlImage + 'user/' + user.image} alt="hinh" className="img-fluid"/>
                                    </td>
                                    <td>{user.name}</td>
                                    <td>{user.slug}</td>
                                    <td className="text-center">10/10/12</td>
                                    <td className="text-center">
                                        <Link to={"/admin/user/show/"+user.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/user/update/"+user.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>UserDelete(user.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{user.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default UserList;