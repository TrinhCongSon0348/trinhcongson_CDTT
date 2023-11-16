import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import postservice from "../../../services/PostService";
import { FaPlus } from "react-icons/fa";

function PostCreate(){
    const navigator = useNavigate();
    const [posts, setPosts] = useState([]);
    const [title, setTitle] = useState("");
    const [topic_id, setTopicId] = useState(0);
    const [status, setStatus] = useState(1);
    function PostStore(event) {
        event.preventDefault(); //Khong load lai trang
        var post = new FormData();
        post.append("title", title);
        post.append("topic_id", topic_id);
        post.append("status", status);
        postservice.create(post)
            .then(function (result) {
                alert(result.data.message);
                navigator("/admin/post", { replace: true })
            });
    }
    useEffect(function () {
        (async function () {
            await postservice.getAll()
                .then(function (result) {
                    setPosts(result.data.posts);
                })
                .catch(function (error) {
                    console.log(error);
                })
        })();
    }, []);
    return (
        <form method="post" onSubmit={PostStore}>
            <div classtitle="card">
                <div classtitle="card-header">
                    <div classtitle="row">
                        <div classtitle="col-md-6">
                            <strong classtitle="text-danger">THEM SAN PHAM</strong>
                        </div>
                        <div classtitle="col-6 text-end">
                            <Link to="/admin/post" classtitle="btn btn-sm btn-success me-1">
                                <FaPlus />Ve danh sach</Link>
                        </div>
                        <button type="submit" classtitle="btn btn-sm btn-success">
                            Luu
                        </button>
                    </div>
                </div>
                <div classtitle="card-body">
                    <div classtitle="row">
                        <div classtitle="col-md-9">
                            <div classtitle="mb-3">
                                <label>
                                    <strong>Tieu de bai viet(*)</strong>
                                </label>
                                <input
                                    value={title}
                                    onChange={(e) => setTitle(e.target.value)}
                                    classtitle="form-control"
                                    type="text"
                                />
                            </div>
                            <div classtitle="col-md-3">
                                <div classtitle="mb-3">
                                    <label>
                                        <strong>Danh muc cha</strong>
                                    </label>
                                    <select value={topic_id} onChange={(e) => setTopicId(e.target.value)}
                                        classtitle="from-control">
                                        <option value="0">Cap cha</option>
                                        {posts.map(function (cat, index) {
                                            return <option key={index} value={cat.id}>{cat.title}</option>
                                        })}
                                    </select>
                                </div>
                                <div classtitle="mb-3">
                                    <label>
                                        <strong>Trang thai</strong>
                                    </label>
                                    <select value={status} onChange={(e) => setStatus(e.target.value)}
                                        classtitle="form-control">
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
export default PostCreate;