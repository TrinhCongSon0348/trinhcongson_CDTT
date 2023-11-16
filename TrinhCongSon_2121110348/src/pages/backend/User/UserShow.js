import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import userservice from "../../../services/UserService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function UserShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [user, setUser] = useState([]);
    useEffect(function () {
        (async function () {
            await userservice.getById(id)
            .then(function (result) {
                setUser(result.data.user);
            }
            );
        })();
    }, []);
    async function UserDelete(id){
        await userservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/user", { replace: true })
        }
        );
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT SẢN PHẨM</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/user" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/user/update/" + user.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>UserDelete(user.id)} className="btn btn-sm btn-danger">
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
                            <td>{user.id}</td>
                        </tr>
                        <tr>
                            <th>Tên người dùng</th>
                            <td>{user.name}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                <img src={urlImage+"user/"+user.image} alt="Hinh"
                                className="img-fluid" style={{maxwidth:200}}/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default UserShow;