import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import memberservice from "../../../services/MemberService";
import { FaPlus } from "react-icons/fa";

function MemberUpdate() {
    const { id } = useParams();
    const navigator = useNavigate();
    const [members, setMembers] = useState([]);
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [phone, setPhone] = useState("");
    const [gioitinh, setGioitinh] = useState("");
    const [address, setAddress] = useState("");
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function MemberEdit(event) {
        event.preventDefault(); //Khong load lai trang
        const image = document.querySelector("#image");
        var member = new FormData();
        member.append("name", name);
        member.append("email", email);
        member.append("phone", phone);
        member.append("gioitinh", gioitinh);
        member.append("address", address);
        member.append("sort_order", sort_order);
        member.append("status", status);
        if (image.files.lenth === 0) {
            member.append("image", "");
        }
        else {
            member.append("image", image.files[0]);
        }
        memberservice.update(member, id)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/member", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await memberservice.getAll()
                .then(function (result) {
                    setMembers(result.data.members);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    useEffect(function () {
        (async function () {
            await memberservice.getById(id)
                .then(function (result) {
                    const tmp = result.data.member;
                    setName(tmp.name);
                    setEmail(tmp.email);
                    setPhone(tmp.phone);
                    setGioitinh(tmp.gioitinh);
                    setAddress(tmp.address);
                    setSortOrder(tmp.sort_order);
                    setStatus(tmp.status);
                }
                );
        })();
    }, []);
    return (
        <form method="post" onSubmit={MemberEdit}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">CAP NHAT THUONG HIEU</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/member" className="btn btn-sm btn-success me-1">
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
                                    <strong>Email(*)</strong>
                                </label>
                                <input
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Phone(*)</strong>
                                </label>
                                <input
                                    value={phone}
                                    onChange={(e) => setPhone(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Gioi tinh(*)</strong>
                                </label>
                                <input
                                    value={gioitinh}
                                    onChange={(e) => setGioitinh(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Dia chi(*)</strong>
                                </label>
                                <input
                                    value={address}
                                    onChange={(e) => setAddress(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Sắp xếp</strong>
                                </label>
                                <select value={sort_order} onChange={(e) => setSortOrder(e.target.value)}
                                    className="form-control">
                                    <option value="0">None</option>
                                    {members.map(function (cat, index) {
                                        return <option key={index} value={cat.sort_order + 1}>Sau:{cat.name}</option>
                                    })}
                                </select>
                            </div>
                            <div className="col-md-3">

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
export default MemberUpdate;