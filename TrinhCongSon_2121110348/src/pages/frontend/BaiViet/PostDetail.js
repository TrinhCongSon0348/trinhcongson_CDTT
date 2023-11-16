import { useEffect, useState } from "react";
import postservice from "../../../services/PostService";
import { useParams } from "react-router-dom";
import { urlImage } from "../../../config";
import PostItem from "../../../component/frontend/PostItem";

function PostDetail() {
    const { slug } = useParams();
    const [post, setPost] = useState([]);
    const [post_other, setPostOther] = useState([]);
    useEffect(function () {
        (async function () {
            await postservice.getPostBySLug(slug).then(function (result) {
                if (result.data.success === true) {
                    setPost(result.data.post);
                    setPostOther(result.data.post_other);
                }
            });
        })();
    }, [slug]);
    return <section className="maincontent">
        <div className="col-md-12 col-sm-12 col-xs-12">
            <div className="post-item border">
                <div className="post-name p-2">
                    <h3 className="text-left text-danger">
                        {post.title}
                    </h3>
                </div>
                <div className="post-image img-article">
                    <img src={urlImage + "/post/" + post.image} alt="hinh" className="img-fluid w-100" />
                </div>
                <div className="post-price p-2">
                    <div className="row">
                        <div className="text-center">
                            {post.detail}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h3>BÀI VIẾT CÙNG CHỦ ĐỀ</h3>
        <div className="row">
            {post_other.map(function (post, index) {
                return <PostItem key={index} post={post} />
            })}
        </div>
    </section>
}

export default PostDetail;