import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import brandservice from "../../../services/BrandService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function BrandShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [brand, setBrand] = useState([]);
    useEffect(function () {
        (async function () {
            await brandservice.getById(id)
            .then(function (result) {
                setBrand(result.data.brand);
            }
            );
        })();
    }, []);
    async function BrandDelete(id){
        await brandservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/brand", { replace: true })
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
                        <Link to="/admin/brand" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/brand/update/"+brand.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>BrandDelete(brand.id)} className="btn btn-sm btn-danger">
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
                            <td>{brand.id}</td>
                        </tr>
                        <tr>
                            <th>Ten thuong hieu</th>
                            <td>{brand.name}</td>
                        </tr>
                        <tr>
                            <th>Slug</th>
                            <td>{brand.slug}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                {/* <img className="img-fluid" src={brand.image} alt="hinh" /> */}
                                <img src={urlImage+"brand/"+brand.image} alt="Hinh"
                                className="img-fluid" style={{maxwidth:200}}/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default BrandShow;