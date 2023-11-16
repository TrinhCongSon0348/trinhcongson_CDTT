import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import topicservice from "../../../services/TopicService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function TopicShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [topic, setTopic] = useState([]);
    useEffect(function () {
        (async function () {
            await topicservice.getById(id)
            .then(function (result) {
                setTopic(result.data.topic);
            }
            );
        })();
    }, []);
    async function TopicDelete(id){
        await topicservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/topic", { replace: true })
        }
        );
    }
    //topicservice.getById(id)
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT SẢN PHẨM</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/topic" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/topic/update/" + topic.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>TopicDelete(topic.id)} className="btn btn-sm btn-danger">
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
                            <td>{topic.id}</td>
                        </tr>
                        <tr>
                            <th>Ten san pham</th>
                            <td>{topic.name}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                <img src={urlImage+"topic/"+topic.image} alt="Hinh"
                                className="img-fluid" style={{maxwidth:200}}/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default TopicShow;