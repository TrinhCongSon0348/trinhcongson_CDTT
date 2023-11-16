import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
import { urlImage } from '../../../config';
import brandservice from "../../../services/BrandService";

function BrandList() {
    const [brands, setBrands] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await brandservice.getAll()
                .then(function (result) {
                    setBrands(result.data.brands);
                }
                );
        })();
    }, [statusdelete]);
    async function BrandDelete(id){
        await brandservice.remove(id).then(function(result){
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
                        <Link to="/admin/brand/create" className="btn btn-sm btn-success">
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
                            <th>Từ khóa</th>
                            <th>Mô tả</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {brands.map(function (brand, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td className="text-center">
                                        <img src={urlImage+'brand/'+brand.image}
                                        alt={brand.image} className="img-fluid"/>
                                    </td>
                                    <td>{brand.name}</td>
                                    <td>{brand.metakey}</td>
                                    <td>{brand.metadesc}</td>
                                    <td className="text-center">
                                        <Link to={"/admin/brand/show/"+brand.id} className="btn btn-sm btn-success me-1 bg-success">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/brand/update/"+brand.id} className="btn btn-sm btn-primary me-1 bg-primary">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>BrandDelete(brand.id)} className="btn btn-sm btn-danger bg-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{brand.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default BrandList;