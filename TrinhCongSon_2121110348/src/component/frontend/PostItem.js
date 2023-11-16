import { Link } from "react-router-dom";
import { urlImage } from "../../config";

function PostItem(props) {
    return (
        // <div class="blog-content col-md-12 col-sm-12 col-xs-12">
        //     <div class="row">
        //         <div class="wrapper-sticky" data-sticky_column="">
        //             <div class="sidebar ">
        //                 <div class="group_sidebar">
        //                     <div class="list-group navbar-inner ">
        //                     </div>
        //                 </div>
        //                 <div class="group_sidebar">
        //                     <div class="list-group navbar-inner ">
        //                     </div>
        //                 </div>
        //                 <div class="group_sidebar">
        //                     <div class="list-group navbar-inner ">
        //                     </div>
        //                 </div>
        //             </div>
        //         </div></div>
        //     <div class="col-md-9 col-sm-12 col-xs-12 ">
        //         <div class="row">
        //             <div class="articles clearfix">
        //                 <div class="col-md-12  col-sm-12 col-xs-12">
        //                     <Link to={"/chi-tiet-bai-viet/" + props.post.slug}>
        //                         <strong className="text-danger fs-3">{props.post.title}</strong>
        //                     </Link>
        //                 </div>
        //                 <div class="news-content">
        //                     <div class="col-md-5 col-xs-12 col-sm-12 img-article">
        //                         <div class="art-img">
        //                             <Link to={"/chi-tiet-bai-viet/" + props.post.slug}>
        //                                 <img src={urlImage + "post/" + props.post.image} className="img-fluid" alt={props.post.image} />
        //                             </Link>
        //                         </div>
        //                     </div>
        //                     <div class=" col-md-7 col-sm-12  col-xs-12">
        //                         <div className="fs-5">{props.post.detail}</div>
        //                         <div class="body-content">
        //                             <ul class="info-more">
        //                             </ul>
        //                         </div>
        //                         <a class="readmore btn-rb clear-fix" href="" role="button">Xem tiếp <span class="fa fa-angle-double-right"></span></a>
        //                     </div>
        //                 </div>
        //             </div>
        //         </div>
        //     </div>
        // </div>

        <div className="col-md-12 col-sm-12 col-xs-12">
            <div className="post-item border">
                <div className="post-name p-2">
                    <h3 className="text-left text-danger">
                        <Link to={"/chi-tiet-bai-viet/" + props.post.slug}>
                            {props.post.title}
                        </Link>
                    </h3>
                </div>
                <div className="post-image img-article">
                    <Link to={"/chi-tiet-bai-viet/" + props.post.slug}>
                        <img src={urlImage + "post/" + props.post.image} className="img-fluid" alt={props.post.image} />
                    </Link>
                </div>
            </div>
        </div>
        
        // <div class="col-md-6">
        //     <div class="wrap_newmore">
        //         <div class="news_flex">
        //             <div class="news">
        //                 <div class="wapanh">
        //                     <a href="/blogs/tin-thoi-trang/cach-chon-vay-cho-nang-beo-bung-cong-so">
        //                         <img src={urlImage + "post/" + props.post.image} className="img-fluid mCS_img_loaded" />
        //                     </a>
        //                 </div>
        //                 <div class="wapinfo">
        //                     <h3 className="text-left text-danger">
        //                         <Link to={"/chi-tiet-bai-viet/" + props.post.slug}>
        //                             {props.post.title}
        //                         </Link>
        //                     </h3>
        //                 </div>
        //             </div>
        //         </div>
        //     </div>
        // </div>
    );
}
export default PostItem;