import { useEffect, useState } from 'react';
import postservice from '../../../services/PostService';
import PostItem from '../../../component/frontend/PostItem';
import topicservice from '../../../services/TopicService';
import { useParams } from 'react-router-dom';

function PostTopic() {
    const { slug } = useParams();
    const [posts, setPosts] = useState([]);
    const [limit, setLimit] = useState(3);
    const [title, setTitle] = useState("Bài viết theo chủ đề");
    document.title = title;
    useEffect(function () {
        (async function () {        
            try {
                const infotopic = await topicservice.getBySlug(slug);
                const topid = infotopic.data.topic.id;
                setTitle(infotopic.data.topic.name);
                const infopost = await postservice.getPostByTopicId(limit, topid);
                setPosts(infopost.data.posts);
            } catch (error) {
                console.error(error);
            }
        })()
    }, [limit])
    return (
        <section className="maincontent my-3">
            <div className="container">
                <div className='row'>
                    <div className='col-md-3'>
                    </div>
                    <div className='col-md-9'>
                        <h3 className="text-center text-danger">{title}</h3>
                        <div className="row">
                            {posts.map(function (post, index) {
                                return <PostItem post={post} key={index} />
                            })}
                        </div>
                        <div className='row'>
                            <div className='col-12 text-center'>
                                <button className="btn btn-seccess" onClick={() => setLimit(limit + 3)}>Xem them</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default PostTopic