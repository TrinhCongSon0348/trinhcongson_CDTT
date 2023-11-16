import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import sliderservice from "../../../services/SliderService";
import { FaPlus } from "react-icons/fa";

function SliderUpdate(){
    const { id } = useParams();
    const navigator = useNavigate();
    const [sliders, setsliders] = useState([]);
    const [name, setName] = useState("");
    const [parent_id, setParentId] = useState(0);
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function SliderEdit(event) {
        event.preventDefault(); //Khong load lai trang
        const image = document.querySelector("#image");
        var slider = new FormData();
        slider.append("name", name);
        slider.append("parent_id", parent_id);
        slider.append("sort_order", sort_order);
        slider.append("status", status);
        if(image.files.lenth===0)
        {
            slider.append("image", "");
        }
        else
        {
            slider.append("image",image.files[0]);
        }
        sliderservice.update(slider,id)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/slider", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await sliderservice.getAll()
                .then(function (result) {
                    setsliders(result.data.sliders);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    useEffect(function () {
        (async function () {
            await sliderservice.getById(id)
            .then(function (result) {
                const tmp=result.data.slider;
                setName(tmp.name);
                setParentId(tmp.parent_id);
                setSortOrder(tmp.sort_order);
                setStatus(tmp.status);
            }
            );
        })();
    }, []);
    return (
        <form method="post" onSubmit={SliderEdit}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">CAP NHAT DANH MỤC</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/slider" className="btn btn-sm btn-success me-1">
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
                                    <strong>Ten san pham(*)</strong>
                                </label>
                                <input
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="col-md-3">
                                <div className="mb-3">
                                    <label>
                                        <strong>Danh muc cha</strong>
                                    </label>
                                    <select value={parent_id} onChange={(e) => setParentId(e.target.value)}
                                        className="from-control">
                                        <option value="0">Cap cha</option>
                                        {sliders.map(function (cat, index) {
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
                                        {sliders.map(function (cat, index) {
                                            return <option key={index} value={cat.sort_order + 1}>Sau:{cat.name}</option>
                                        })}
                                    </select>
                                </div>
                                <div className="mb-3">
                                    <label>
                                        <strong>Hinh</strong>
                                    </label>
                                    <input id="image" className="form-control" type="file" />
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
export default SliderUpdate;