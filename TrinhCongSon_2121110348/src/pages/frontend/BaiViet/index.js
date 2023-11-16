import PostItem from '../../../component/frontend/PostItem';
import { useEffect, useState } from 'react';
import postservice from '../../../services/PostService';

function Post() {
    const [posts, setPosts] = useState([]);
    const [limit, setLimit] = useState(4);
    useEffect(function () {
        (async function () {
            await postservice.getPostAll(limit,1).then(function (result) {
                setPosts(result.data.posts);
            });
        })()
    }, [limit])
    return (
        <section className="maincontent my-3">
            <div className="container">
                <h3 className="text-center text-danger">TẤT CẢ BÀI VIẾT</h3>
                <div className="row">
                    {posts.map(function (post, index) {
                        return <PostItem post={post} key={index} />;
                    })}
                </div>
                <div className='row'>
                    <div className='col-12 text-center'>
                        <button className="btn btn-seccess" onClick={() => setLimit(limit + 4)}>Xem thêm</button>
                    </div>
                </div>

            </div>
        </section>
    );
}

export default Post;