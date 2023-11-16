import { Link } from "react-router-dom";
import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
import { useEffect, useState } from "react";
// import axios from "axios";
import { urlImage } from '../../../config';
import memberservice from "../../../services/MemberService";

function MemberList() {
    const [members, setMembers] = useState([]);
    const [statusdelete, setStatusDelete] = useState(0);
    useEffect(function () {
        (async function () {
            await memberservice.getAll()
                .then(function (result) {
                    setMembers(result.data.members);
                }
                );
        })();
    }, [statusdelete]);
    async function MemberDelete(id){
        await memberservice.remove(id).then(function(result){
            alert(result.data.message);
            setStatusDelete(id);
        })
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH THƯƠNG HIỆU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/member/create" className="btn btn-sm btn-success">
                            <FaPlus />Thêm</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th style={{ width: 130 }} className="text-center">Hình</th>
                            <th>Tên thương hiệu</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Giới tính</th>
                            <th>Địa chỉ</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {members.map(function (member, index) {
                            return (
                                <tr key={index}>
                                    <td className="text-center">
                                        <input type="checkbox"></input>
                                    </td>
                                    <td className="text-center">
                                        <img src={urlImage+'member/'+member.image}
                                        alt={member.image} className="img-fluid"/>
                                    </td>
                                    <td>{member.name}</td>
                                    <td>{member.email}</td>
                                    <td>{member.phone}</td>
                                    <td>{member.gioitinh}</td>
                                    <td>{member.address}</td>
                                    <td className="text-center">
                                        <Link to={"/admin/member/show/"+member.id} className="btn btn-sm btn-success me-1">
                                            <FaRegEye /></Link>
                                        <Link to={"/admin/member/update/"+member.id} className="btn btn-sm btn-primary me-1">
                                            <FaEdit />Sửa</Link>
                                        <button onClick={()=>MemberDelete(member.id)} className="btn btn-sm btn-danger">
                                            <FaTrash />Xóa
                                        </button>
                                    </td>
                                    <td className="text-center">{member.id}</td>
                                </tr>
                            );
                        })}

                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default MemberList;