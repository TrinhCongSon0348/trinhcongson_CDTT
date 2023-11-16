import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
// import { urlImage } from '../../../config';
import postdetailservice from "../../../services/PostDetailService";

function PostDetailList() {
    const [postdetails, setPostDetails] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await postdetailservice.getAll()
                .then(function (result) {
                    setPostDetails(result.data.postdetails);
                }
                );
        })();
    }, [statusdelete]);
    async function PostDetailDelete(id){
        await postdetailservice.remove(id).then(function(result){
            alert(result.data.message);
            setStatusDelete(id);
        })
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH THƯƠNG HIỆU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/postdetail/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th>Tên thương hiệu</th>
                            <th>Tiêu đề</th>
                            <th>Mô tả</th>
                            <th style={{ width: 130 }} className="text-center">Ngày tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {postdetails.map(function (postdetail, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td>{postdetail.name}</td>
                                    <td>{postdetail.title}</td>
                                    <td>{postdetail.detail}</td>
                                    <td className="text-center">10/10/12</td>
                                    <td className="text-center">
                                        <Link to={"/admin/postdetail/show/"+postdetail.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/postdetail/update/"+postdetail.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>PostDetailDelete(postdetail.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{postdetail.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default PostDetailList;