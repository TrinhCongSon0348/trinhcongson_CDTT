import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import productservice from "../../../services/ProductService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function ProductShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [product, setProduct] = useState([]);
    useEffect(function () {
        (async function () {
            await productservice.getById(id)
                .then(function (result) {
                    setProduct(result.data.product);
                }
                );
        })();
    }, []);
    async function ProductDelete(id) {
        await productservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/product", { replace: true })
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
                        <Link to="/admin/product" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/product/update/" + product.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={() => ProductDelete(product.id)} className="btn btn-sm btn-danger">
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
                            <td>{product.id}</td>
                        </tr>
                        <tr>
                            <th>Ten san pham</th>
                            <td>{product.name}</td>
                        </tr>
                        <tr>
                            <th>Từ khóa</th>
                            <td>{product.metakey}</td>
                        </tr>
                        <tr>
                            <th>Mô tả</th>
                            <td>{product.metadesc}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                <img src={urlImage + "product/" + product.image} alt="Hinh"
                                    className="img-fluid" style={{ maxwidth: 200 }} />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default ProductShow;