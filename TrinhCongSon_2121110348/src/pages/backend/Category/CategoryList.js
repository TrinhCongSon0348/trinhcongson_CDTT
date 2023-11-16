import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
import { urlImage } from '../../../config';
import categoryservice from "../../../services/CategoryService";

function CategoryList() {
    const [categorys, setCategorys] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await categoryservice.getAll()
                .then(function (result) {
                    setCategorys(result.data.categorys);
                }
                );
        })();
    }, [statusdelete]);
    async function CategoryDelete(id){
        await categoryservice.remove(id).then(function(result){
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
                        <Link to="/admin/category/create" className="btn btn-sm btn-success">
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
                            <th>Tên sản phẩm</th>
                            <th>Từ khóa</th>
                            <th>Mô tả</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {categorys.map(function (category, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td className="text-center">
                                        <img src={urlImage + 'category/' + category.image} 
                                        alt={category.image} className="img-fluid"/>
                                    </td>
                                    <td>{category.name}</td>
                                    <td>{category.metakey}</td>
                                    <td>{category.metadesc}</td>
                                    <td className="text-center">
                                        <Link to={"/admin/category/show/"+category.id} className="btn btn-sm btn-success me-1 bg-success">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/category/update/"+category.id} className="btn btn-sm btn-primary me-1 bg-primary">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>CategoryDelete(category.id)} className="btn btn-sm btn-danger bg-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{category.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default CategoryList;