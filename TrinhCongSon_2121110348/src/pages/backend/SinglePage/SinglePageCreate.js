import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import singlepageservice from "../../../services/SinglePageService";
import { FaPlus } from "react-icons/fa";

function SinglePageCreate(){
    const navigator = useNavigate();
    const [singlepages, setSinglePages] = useState([]);
    const [name, setName] = useState("");
    const [link, setLink] = useState("");
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function SinglePageStore(event) {
        event.preventDefault(); //Khong load lai trang
        var singlepage = new FormData();
        singlepage.append("name", name);
        singlepage.append("link", link);
        singlepage.append("sort_order", sort_order);
        singlepage.append("status", status);
        singlepageservice.create(singlepage)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/singlepage", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await singlepageservice.getAll()
                .then(function (result) {
                    setSinglePages(result.data.singlepages);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    return (
        <form method="post" onSubmit={SinglePageStore}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">THEM THUONG HIEU</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/singlepage" className="btn btn-sm btn-success me-1">
                                <FaPlus />Ve danh sach</Link>
                        </div>
                        <button type="submit" className="btn btn-sm btn-success">
                            Luu
                        </button>
                    </div>
                </div>
                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9">
                            <div className="mb-3">
                                <label>
                                    <strong>Ten thuong hieu(*)</strong>
                                </label>
                                <input
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Tu khoa(*)</strong>
                                </label>
                                <textarea
                                    value={link}
                                    onChange={(e) => setLink(e.target.value)}
                                    className="form-control"
                                ></textarea>
                            </div>
                            <div className="col-md-3">
                                <div className="mb-3">
                                    <label>
                                        <strong>Sap xep</strong>
                                    </label>
                                    <select value={sort_order} onChange={(e) => setSortOrder(e.target.value)}
                                        className="form-control">
                                        <option value="0">None</option>
                                        {singlepages.map(function (cat, index) {
                                            return <option key={index} value={cat.sort_order + 1}>Sau:{cat.name}</option>
                                        })}
                                    </select>
                                </div>
                                <div className="mb-3">
                                    <label>
                                        <strong>Trang thai</strong>
                                    </label>
                                    <select value={status} onChange={(e) => setStatus(e.target.value)}
                                        className="form-control">
                                        <option value="1">Xuat ban</option>
                                        <option value="2">Chua xuat ban</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    );
}
export default SinglePageCreate;