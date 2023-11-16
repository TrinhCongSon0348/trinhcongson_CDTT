import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import singlepageservice from "../../../services/SinglePageService";
import { useEffect, useState } from "react";

function SinglePageShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [singlepage, setSinglePage] = useState([]);
    useEffect(function () {
        (async function () {
            await singlepageservice.getById(id)
            .then(function (result) {
                setSinglePage(result.data.singlepage);
            }
            );
        })();
    }, []);
    async function SinglePageDelete(id){
        await singlepageservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/singlepage", { replace: true })
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
                        <Link to="/admin/singlepage" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/singlepage/update/"+singlepage.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>SinglePageDelete(singlepage.id)} className="btn btn-sm btn-danger">
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
                            <td>{singlepage.id}</td>
                        </tr>
                        <tr>
                            <th>Ten thuong hieu</th>
                            <td>{singlepage.name}</td>
                        </tr>
                        <tr>
                            <th>Slug</th>
                            <td>{singlepage.link}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default SinglePageShow;