import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import postservice from '../../../services/PostService';
import PostItem from '../../../component/frontend/PostItem';

function PostNew() {
    const [posts, setPosts] = useState([]);
    const [limit, setLimit] = useState(8);
    useEffect(function () {
        (async function () {
            await postservice.getPostNew(limit, 4).then(function (result) {
                setPosts(result.data.posts);
            });
        })()
    }, [limit])
    return (
        <section className="maincontent my-3">
            <div className="container">
                <div className='row'>
                    <div className='col-md-3'>
                        {/* <ListCategory/>
                        <ListBrand/> */}
                    </div>
                    <div className='col-md-9'>
                        <div className="row">
                            {posts.map(function (post, index) {
                                return <PostItem post={post} key={index} />
                            })}
                        </div>
                        <div className='row'>
                            <div className='col-12 text-center'>
                                <button className="btn btn-seccess" onClick={() => setLimit(limit + 4)}>Xem thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default PostNew