import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import postdetailservice from "../../../services/PostDetailService";
import { useEffect, useState } from "react";
// import { urlImage } from "../../../config";

function PostDetailShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [postdetail, setPostDetail] = useState([]);
    useEffect(function () {
        (async function () {
            await postdetailservice.getById(id)
            .then(function (result) {
                setPostDetail(result.data.postdetail);
            }
            );
        })();
    }, []);
    async function PostDetailDelete(id){
        await postdetailservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/postdetail", { replace: true })
        }
        );
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT THƯƠNG HIỆU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/postdetail" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/postdetail/update/"+postdetail.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>PostDetailDelete(postdetail.id)} className="btn btn-sm btn-danger">
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
                            <td>{postdetail.id}</td>
                        </tr>
                        <tr>
                            <th>Ten thuong hieu</th>
                            <td>{postdetail.name}</td>
                        </tr>
                        <tr>
                            <th>Tiêu đề</th>
                            <td>{postdetail.title}</td>
                        </tr>
                        <tr>
                            <th>Mô tả</th>
                            <td>{postdetail.detail}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default PostDetailShow;