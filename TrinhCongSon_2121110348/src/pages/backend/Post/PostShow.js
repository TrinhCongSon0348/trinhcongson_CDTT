import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import postservice from "../../../services/PostService";
import { useEffect, useState } from "react";
// import { urlImage } from "../../../config";

function PostShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [post, setPost] = useState([]);
    useEffect(function () {
        (async function () {
            await postservice.getById(id)
            .then(function (result) {
                setPost(result.data.post);
            }
            );
        })();
    }, []);
    async function PostDelete(id){
        await postservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/post", { replace: true })
        }
        );
    }
    //postservice.getById(id)
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT BÀI VIẾT</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/post" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/post/update/" + post.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>PostDelete(post.id)} className="btn btn-sm btn-danger">
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
                            <td>{post.id}</td>
                        </tr>
                        <tr>
                            <th>Tiêu đề</th>
                            <td>{post.title}</td>
                        </tr>
                        <tr>
                            <th>Slug</th>
                            <td>{post.slug}</td>
                        </tr>
                        {/* <tr>
                            <th>Chi tiết</th>
                            <td>{post.detail}</td>
                        </tr> */}
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default PostShow;