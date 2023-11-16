import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import contactservice from "../../../services/ContactService";
import { useEffect, useState } from "react";

function ContactShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [contact, setContact] = useState([]);
    useEffect(function () {
        (async function () {
            await contactservice.getById(id)
            .then(function (result) {
                setContact(result.data.contact);
            }
            );
        })();
    }, []);
    async function ContactDelete(id){
        await contactservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/contact", { replace: true })
        }
        );
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT LIÊN HỆ</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/contact" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/contact/update/"+contact.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>ContactDelete(contact.id)} className="btn btn-sm btn-danger">
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
                            <td>{contact.id}</td>
                        </tr>
                        <tr>
                            <th>Ten thuong hieu</th>
                            <td>{contact.name}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>{contact.email}</td>
                        </tr>
                        <tr>
                            <th>Số điện thoại</th>
                            <td>{contact.phone}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default ContactShow;