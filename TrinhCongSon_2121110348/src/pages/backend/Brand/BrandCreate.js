import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import brandservice from "../../../services/BrandService";
import { FaPlus } from "react-icons/fa";

function BrandCreate() {
    const navigator = useNavigate();
    const [brands, setBrands] = useState([]);
    const [name, setName] = useState("");
    const [metakey, setMetakey] = useState("");
    const [metadesc, setMetadesc] = useState("");
    const [parent_id, setParentId] = useState(0);
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function BrandStore(event) {
        event.preventDefault(); //Khong load lai trang
        const image = document.querySelector("#image");
        var brand = new FormData();
        brand.append("name", name);
        brand.append("metakey", metakey);
        brand.append("metadesc", metadesc);
        brand.append("parent_id", parent_id);
        brand.append("sort_order", sort_order);
        brand.append("status", status);
        if (image.files.lenth === 0) {
            brand.append("image", "");
        }
        else {
            brand.append("image", image.files[0]);
        }
        brandservice.create(brand)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/brand", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await brandservice.getAll()
                .then(function (result) {
                    setBrands(result.data.brands);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    return (
        <form method="post" onSubmit={BrandStore}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">THÊM THƯƠNG HIỆU</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/brand" className="btn btn-sm btn-success me-1">
                                <FaPlus />Về danh sách</Link>
                        </div>
                        <button type="submit" className="btn btn-sm btn-success">
                            Lưu
                        </button>
                    </div>
                </div>
                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9">
                            <div className="mb-3">
                                <label>
                                    <strong>Tên thương hiệu(*)</strong>
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
                                    <strong>Từ khóa(*)</strong>
                                </label>
                                <textarea
                                    value={metakey}
                                    onChange={(e) => setMetakey(e.target.value)}
                                    className="form-control"
                                ></textarea>
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Mô tả(*)</strong>
                                </label>
                                <textarea
                                    value={metadesc}
                                    onChange={(e) => setMetadesc(e.target.value)}
                                    className="form-control"
                                ></textarea>
                            </div>
                            <div className="col-md-3">
                                <div className="mb-3">
                                    <label>
                                        <strong>Danh mục cha</strong>
                                    </label>
                                    <select value={parent_id} onChange={(e) => setParentId(e.target.value)}
                                        className="from-control">
                                        <option value="0">Cấp cha</option>
                                        {brands.map(function (cat, index) {
                                            return <option key={index} value={cat.id}>{cat.name}</option>
                                        })}
                                    </select>
                                </div>
                                <div className="mb-3">
                                    <label>
                                        <strong>Sắp xếp</strong>
                                    </label>
                                    <select value={sort_order} onChange={(e) => setSortOrder(e.target.value)}
                                        className="form-control">
                                        <option value="0">None</option>
                                        {brands.map(function (cat, index) {
                                            return <option key={index} value={cat.sort_order + 1}>Sau:{cat.name}</option>
                                        })}
                                    </select>
                                </div>
                                <div className="mb-3">
                                    <label>
                                        <strong>Hình</strong>
                                    </label>
                                    <input id="image" className="form-control" type="file" />
                                </div>
                                <div className="mb-3">
                                    <label>
                                        <strong>Trạng thái</strong>
                                    </label>
                                    <select value={status} onChange={(e) => setStatus(e.target.value)}
                                        className="form-control">
                                        <option value="1">Xuất bản</option>
                                        <option value="2">Chưa xuất bản</option>
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
export default BrandCreate;