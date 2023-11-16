import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
import singlepageservice from "../../../services/SinglePageService";

function SinglePageList() {
    const [singlepages, setSinglePages] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await singlepageservice.getAll()
                .then(function (result) {
                    setSinglePages(result.data.singlepages);
                }
                );
        })();
    }, [statusdelete]);
    async function SinglePageDelete(id){
        await singlepageservice.remove(id).then(function(result){
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
                        <Link to="/admin/singlepage/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th style={{ width: 130 }} className="text-center">Hình</th>
                            <th>Tên thương hiệu</th>
                            <th>Slug</th>
                            <th style={{ width: 130 }} className="text-center">Ngày tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {singlepages.map(function (singlepage, index) {
                            return (
                                <tr key={index}>    
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td>{singlepage.name}</td>
                                    <td>{singlepage.link}</td>
                                    <td className="text-center">10/10/12</td>
                                    <td className="text-center">
                                        <Link to={"/admin/singlepage/show/"+singlepage.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/singlepage/update/"+singlepage.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>SinglePageDelete(singlepage.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xoa
                                        </button>
                                    </td>
                                    <td className="text-center">{singlepage.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default SinglePageList;