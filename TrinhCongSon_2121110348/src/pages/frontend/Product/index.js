import ProductItem from '../../../component/frontend/ProductItem';
import { useEffect, useState } from 'react';
import productservice from '../../../services/ProductService';

function Product() {
    const [products, setProducts] = useState([]);
    const [limit, setLimit] = useState(8);
    useEffect(function () {
        (async function () {
            await productservice.getProductAll(limit,1).then(function (result) {
                setProducts(result.data.products);
            });
        })()
    }, [limit])
    return (
        <section className="maincontent my-3">
            <div className="container">
                <h3 className="text-center text-danger">TẤT CẢ SẢN PHẨM</h3>
                <div className="row">
                    {products.map(function (product, index) {
                        return <ProductItem product={product} key={index} />;
                    })}
                </div>
                <div className='row'>
                    <div className='col-12 text-center'>
                        <button className="btn btn-seccess" onClick={() => setLimit(limit + 8)}>Xem thêm</button>
                    </div>
                </div>

            </div>
        </section>
    );
}

export default Product;