import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import postdetailservice from "../../../services/PostDetailService";
import { FaPlus } from "react-icons/fa";

function PostDetailUpdate(){
    const { id } = useParams();
    const navigator = useNavigate();
    const [postdetails, setPostDetails] = useState([]);
    const [name, setName] = useState("");
    const [title, setTitle] = useState("");
    const [detail, setDetail] = useState("");
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function PostDetailEdit(event) {
        event.preventDefault(); //Khong load lai trang
        var postdetail = new FormData();
        postdetail.append("name", name);
        postdetail.append("title", title);
        postdetail.append("detail", detail);
        postdetail.append("sort_order", sort_order);
        postdetail.append("status", status);
        postdetailservice.update(postdetail,id)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/postdetail", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await postdetailservice.getAll()
                .then(function (result) {
                    setPostDetails(result.data.postdetails);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    useEffect(function () {
        (async function () {
            await postdetailservice.getById(id)
            .then(function (result) {
                const tmp=result.data.postdetail;
                setName(tmp.name);
                setTitle(tmp.title);
                setDetail(tmp.detail);
                setSortOrder(tmp.sort_order);
                setStatus(tmp.status);
            }
            );
        })();
    }, []);
    return (
        <form method="post" onSubmit={PostDetailEdit}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">CAP NHAT THUONG HIEU</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/postdetail" className="btn btn-sm btn-success me-1">
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
                                    value={title}
                                    onChange={(e) => setTitle(e.target.value)}
                                    className="form-control"
                                ></textarea>
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Mo ta(*)</strong>
                                </label>
                                <textarea
                                    value={detail}
                                    onChange={(e) => setDetail(e.target.value)}
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
                                        {postdetails.map(function (cat, index) {
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
export default PostDetailUpdate;