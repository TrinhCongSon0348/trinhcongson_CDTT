import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import memberservice from "../../../services/MemberService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function MemberShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [member, setMember] = useState([]);
    useEffect(function () {
        (async function () {
            await memberservice.getById(id)
            .then(function (result) {
                setMember(result.data.member);
            }
            );
        })();
    }, []);
    async function MemberDalete(id){
        await memberservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/member", { replace: true })
        }
        );
    }
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT THƯƠNG HIỆU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/member" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/member/update/"+member.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>MemberDalete(member.id)} className="btn btn-sm btn-danger">
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
                            <td>{member.id}</td>
                        </tr>
                        <tr>
                            <th>Ten thuong hieu</th>
                            <td>{member.name}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>{member.email}</td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td>{member.phone}</td>
                        </tr>
                        <tr>
                            <th>Gioi tinh</th>
                            <td>{member.gioitinh}</td>
                        </tr>
                        <tr>
                            <th>Dia chi</th>
                            <td>{member.address}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                {/* <img className="img-fluid" src={brand.image} alt="hinh" /> */}
                                <img src={urlImage+"member/"+member.image} alt="Hinh"
                                className="img-fluid" style={{maxwidth:200}}/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default MemberShow;