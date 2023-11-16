import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import categoryservice from "../../../services/CategoryService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function CategoryShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [category, setCategory] = useState([]);
    useEffect(function () {
        (async function () {
            await categoryservice.getById(id)
            .then(function (result) {
                setCategory(result.data.category);
            }
            );
        })();
    }, []);
    async function CategoryDelete(id){
        await categoryservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/category", { replace: true })
        }
        );
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-6">
                        <strong className="text-danger text-uppercase">CHI TIẾT DANH MỤC</strong>
                    </div>
                    <div className="col-6 text-end">
                        <Link to="/admin/category" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/category/update/"+category.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>CategoryDelete(category.id)} className="btn btn-sm btn-danger">
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
                            <td>{category.id}</td>
                        </tr>
                        <tr>
                            <th>Ten san pham</th>
                            <td>{category.name}</td>
                        </tr>
                        <tr>
                            <th>Từ khóa</th>
                            <td>{category.metakey}</td>
                        </tr>
                        <tr>
                            <th>Mô tả</th>
                            <td>{category.metadesc}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                  
                                <img src={urlImage+"category/"+category.image} alt="Hinh"
                                className="img-fluid" style={{maxwidth:200}}/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default CategoryShow;