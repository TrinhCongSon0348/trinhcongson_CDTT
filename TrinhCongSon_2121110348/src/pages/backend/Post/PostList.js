import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
// import { urlImage } from '../../../config';
import postservice from "../../../services/PostService";

function PostList() {
    const [posts, setPosts] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await postservice.getAll()
                .then(function (result) {
                    setPosts(result.data.posts);
                }
                );
        })();
    }, [statusdelete]);
    function PostDelete(id){
        postservice.remove(id).then(function(result){
            alert(result.data.message);
            setStatusDelete(id);
        })
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH MỤC BÀI VIẾT</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/post/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th style={{ width: 120 }} className="text-center">Tiêu đề</th>
                            <th>Slug</th>
                            {/* <th>Chi tiết</th> */}
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {posts.map(function (post, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td className="text-center">
                                        {post.title}
                                    </td>
                                    <td>{post.slug}</td>
                                    {/* <td>{post.detail}</td> */}
                                    <td className="text-center">
                                        <Link to={"/admin/post/show/"+post.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/post/update/"+post.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>PostDelete(post.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{post.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default PostList;