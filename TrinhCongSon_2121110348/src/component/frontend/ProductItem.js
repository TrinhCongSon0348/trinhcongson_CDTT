import { urlImage } from "../../config";
import { Link } from "react-router-dom";
// import { useState, useEffect } from "react";
// import { products } from "../../datatest/products";

function ProductItem(props) {
    return (
        <div className="col-md-3 mb-3">
            <div className="product-item border">
                <div className="product-image">
                    <Link to={"/chi-tiet-san-pham/" + props.product.slug}>
                        <img src={urlImage + "product/" + props.product.image} className="img-fluid" alt={props.product.image} />
                    </Link>
                </div>
                <div className="product-name p-2">
                    <h3 className="text-center text-danger fs-6">
                        <Link to={"/chi-tiet-san-pham/" + props.product.slug}>
                            {props.product.name}
                        </Link>
                    </h3>
                </div>
                <div className="product-price p-2">
                    <div className="row">
                        <div className="col-6">
                            <strong className="text-danger fs-3">{props.product.price_sale}<sup>$</sup></strong>
                        </div>
                        <div className="col-6 text-end">
                            <del className="fs-5">{props.product.price}</del><sup>$</sup>
                        </div>
                    </div>
                </div>
                <div className="link-defail">
                    <h3 className="text-danger fs-6">
                        <Link to={"/chi-tiet-san-pham/" + props.product.slug}>
                            CHI TIẾT
                        </Link>
                    </h3>
                </div>
                <div className="link-defail">
                    <h3 className="text-white fs-4">
                        <button type="button" class="btn btn-cart" >
                            <Link to={"/gio-hang/" + props.product.id} className="text-white">
                                Thêm Vào Giỏ
                            </Link>
                        </button>
                    </h3>
                </div>
            </div>
        </div>
    );
}

export default ProductItem;