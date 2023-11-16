import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
// import { urlImage } from '../../../config';
import contactservice from "../../../services/ContactService";

function ContactList() {
    const [contacts, setContacts] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await contactservice.getAll()
                .then(function (result) {
                    setContacts(result.data.contacts);
                }
                );
        })();
    }, [statusdelete]);
    async function ContactDelete(id){
        await contactservice.remove(id).then(function(result){
            alert(result.data.message);
            setStatusDelete(id);
        })
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH LIÊN HỆ</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/contact/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th>Tên thương hiệu</th>
                            <th style={{ width: 130 }} className="text-center">Email</th>
                            <th style={{ width: 140 }} className="text-center">Số điện thoại</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {contacts.map(function (contact, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td>{contact.name}</td>
                                    <td>{contact.email}</td>
                                    <td>{contact.phone}</td>
                                    <td className="text-center">10/10/12</td>
                                    <td className="text-center">
                                        <Link to={"/admin/contact/show/"+contact.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/contact/update/"+contact.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>ContactDelete(contact.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{contact.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default ContactList;