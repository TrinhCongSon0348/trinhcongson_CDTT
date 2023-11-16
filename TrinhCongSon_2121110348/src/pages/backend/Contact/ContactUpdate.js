import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import contactservice from "../../../services/ContactService";
import { FaPlus } from "react-icons/fa";

function ContactUpdate() {
    const { id } = useParams();
    const navigator = useNavigate();
    const [contacts, setContacts] = useState([]);
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [phone, setPhone] = useState("");
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function ContactEdit(event) {
        event.preventDefault(); //Khong load lai trang
        var contact = new FormData();
        contact.append("name", name);
        contact.append("email", email);
        contact.append("phone", phone);
        contact.append("sort_order", sort_order);
        contact.append("status", status);
        contactservice.update(contact, id)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/contact", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await contactservice.getAll()
                .then(function (result) {
                    setContacts(result.data.contacts);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    useEffect(function () {
        (async function () {
            await contactservice.getById(id)
                .then(function (result) {
                    const tmp = result.data.contact;
                    setName(tmp.name);
                    setEmail(tmp.email);
                    setPhone(tmp.phone);
                    setSortOrder(tmp.sort_order);
                    setStatus(tmp.status);
                }
                );
        })();
    }, []);
    return (
        <form method="post" onSubmit={ContactEdit}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">CẬP NHẬT LIÊN HỆ</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/contact" className="btn btn-sm btn-success me-1">
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
                                <textarea
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    className="form-control"
                                ></textarea>
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Số điện thoại(*)</strong>
                                </label>
                                <textarea
                                    value={phone}
                                    onChange={(e) => setPhone(e.target.value)}
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
                                        {contacts.map(function (cat, index) {
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
export default ContactUpdate;