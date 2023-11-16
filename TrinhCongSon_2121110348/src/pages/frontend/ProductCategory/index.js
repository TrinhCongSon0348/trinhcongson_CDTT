import { useEffect, useState } from 'react';
import productservice from '../../../services/ProductService';
import ProductItem from '../../../component/frontend/ProductItem';
import categoryservice from '../../../services/CategoryService';
import { useParams } from 'react-router-dom';

function ProductCategory() {
    const { slug } = useParams();
    const [products, setProducts] = useState([]);
    const [limit, setLimit] = useState(4);
    const [title, setTitle] = useState("Danh mục sản phẩm");
    document.title = title;
    useEffect(function () {
        (async function () {
            try {
                const infocategory = await categoryservice.getBySlug(slug);
                const catid = infocategory.data.category.id;
                setTitle(infocategory.data.category.name);
                const infoproduct = await productservice.getProductByCategoryId(limit, catid);
                setProducts(infoproduct.data.products);
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
                            {products.map(function (product, index) {
                                return <ProductItem product={product} key={index} />
                            })}
                        </div>
                        <div className='row'>
                            <div className='col-12 text-center'>
                                <button className="btn btn-seccess" onClick={() => setLimit(limit + 4)}>Xem them</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default ProductCategory