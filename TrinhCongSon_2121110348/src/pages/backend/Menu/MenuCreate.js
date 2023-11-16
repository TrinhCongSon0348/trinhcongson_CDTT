import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import menuservice from "../../../services/MenuService";
import { FaPlus } from "react-icons/fa";

function MenuCreate() {
    const navigator = useNavigate();
    const [menus, setMenus] = useState([]);
    const [name, setName] = useState("");
    const [link, setLink] = useState("");
    const [parent_id, setParentId] = useState(0);
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function MenuStore(event) {
        event.preventDefault(); //Khong load lai trang
        var menu = new FormData();
        menu.append("name", name);
        menu.append("link", link);
        menu.append("parent_id", parent_id);
        menu.append("sort_order", sort_order);
        menu.append("status", status);
        menuservice.create(menu)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/menu", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await menuservice.getAll()
                .then(function (result) {
                    setMenus(result.data.menus);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    return (
        <form method="post" onSubmit={MenuStore}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">THEM DANH MỤC</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/menu" className="btn btn-sm btn-success me-1">
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
                                    <strong>Link(*)</strong>
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
                                        <strong>Danh muc cha</strong>
                                    </label>
                                    <select value={parent_id} onChange={(e) => setParentId(e.target.value)}
                                        className="from-control">
                                        <option value="0">Cap cha</option>
                                        {menus.map(function (cat, index) {
                                            return <option key={index} value={cat.id}>{cat.name}</option>
                                        })}
                                    </select>
                                </div>
                                <div className="mb-3">
                                    <label>
                                        <strong>Sap xep</strong>
                                    </label>
                                    <select value={sort_order} onChange={(e) => setSortOrder(e.target.value)}
                                        className="form-control">
                                        <option value="0">None</option>
                                        {menus.map(function (cat, index) {
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
export default MenuCreate;