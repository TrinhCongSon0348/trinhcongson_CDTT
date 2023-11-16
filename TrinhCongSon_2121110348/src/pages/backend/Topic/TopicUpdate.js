import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import topicservice from "../../../services/TopicService";
import { FaPlus } from "react-icons/fa";

function TopicUpdate(){
    const { id } = useParams();
    const navigator = useNavigate();
    const [topics, setTopics] = useState([]);
    const [name, setName] = useState("");
    const [parent_id, setParentId] = useState(0);
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    function TopicEdit(event) {
        event.preventDefault(); //Khong load lai trang
        const image = document.querySelector("#image");
        var topic = new FormData();
        topic.append("name", name);
        topic.append("parent_id", parent_id);
        topic.append("sort_order", sort_order);
        topic.append("status", status);
        if(image.files.lenth===0)
        {
            topic.append("image", "");
        }
        else
        {
            topic.append("image",image.files[0]);
        }
        topicservice.update(topic,id)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/topic", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await topicservice.getAll()
                .then(function (result) {
                    setTopics(result.data.topics);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    useEffect(function () {
        (async function () {
            await topicservice.getById(id)
            .then(function (result) {
                const tmp=result.data.topic;
                setName(tmp.name);
                setParentId(tmp.parent_id);
                setSortOrder(tmp.sort_order);
                setStatus(tmp.status);
            }
            );
        })();
    }, []);
    return (
        <form method="post" onSubmit={TopicEdit}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">CAP NHAT DANH MỤC</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/topic" className="btn btn-sm btn-success me-1">
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
                                        {topics.map(function (cat, index) {
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
                                        {topics.map(function (cat, index) {
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
export default TopicUpdate;