import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import postservice from "../../../services/PostService";
import { FaPlus } from "react-icons/fa";

function PostUpdate(){
    const { id } = useParams();
    const navigator = useNavigate();
    const [posts, setPosts] = useState([]);
    const [title, setTitle] = useState("");
    const [slug, setSlug] = useState("");
    const [sort_order, setSortorder] = useState(0);
    const [status, setStatus] = useState(1);
    function PostEdit(event) {
        event.preventDefault(); //Khong load lai trang
        var post = new FormData();
        post.append("title", title);
        post.append("slug", slug);
        post.append("sort_order", sort_order);
        post.append("status", status);
        postservice.update(post,id)
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
    useEffect(function () {
        (async function () {
            await postservice.getById(id)
            .then(function (result) {
                const tmp=result.data.post;
                setTitle(tmp.title);
                setSlug(tmp.slug);
                setSortorder(tmp.sort_order);
                setStatus(tmp.status);
            }
            );
        })();
    }, []);
    return (
        <form method="post" onSubmit={PostEdit}>
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-danger">CẬP NHẬT BÀI VIẾT</strong>
                        </div>
                        <div className="col-6 text-end">
                            <Link to="/admin/post" className="btn btn-sm btn-success me-1">
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
                                    <strong>Tiêu đề(*)</strong>
                                </label>
                                <input
                                    value={title}
                                    onChange={(e) => setTitle(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="mb-3">
                                <label>
                                    <strong>Chi tiết(*)</strong>
                                </label>
                                <input
                                    value={slug}
                                    onChange={(e) => setSlug(e.target.value)}
                                    className="form-control"
                                    type="text"
                                />
                            </div>
                            <div className="col-md-3">
                                {/* <div className="mb-3">
                                    <label>
                                        <strong>Danh muc cha</strong>
                                    </label>
                                    <select value={replay_id} onChange={(e) => setReplayId(e.target.value)}
                                        className="from-control">
                                        <option value="0">Cap cha</option>
                                        {posts.map(function (cat, index) {
                                            return <option key={index} value={cat.id}>{cat.name}</option>
                                        })}
                                    </select>
                                </div> */}
                                <div className="mb-3">
                                    <label>
                                        <strong>Sắp xếp</strong>
                                    </label>
                                    <select value={sort_order} onChange={(e) => setSortorder(e.target.value)}
                                        className="form-control">
                                        <option value="0">None</option>
                                        {posts.map(function (cat, index) {
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
export default PostUpdate;