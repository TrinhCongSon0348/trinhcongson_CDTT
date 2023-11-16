import { useEffect, useState } from 'react';
import productservice from '../../../services/ProductService';
import ProductItem from '../../../component/frontend/ProductItem';
import { useParams } from 'react-router-dom';
import brandservice from '../../../services/BrandService';
// import ListCategory from '../../../layouts/layoutSite/listcategory';
// import ListBrand from '../../../layouts/layoutSite/listBrand';

function ProductBrand() {
    const { slug } = useParams();
    const [products, setProducts] = useState([]);
    const [limit, setLimit] = useState(4);
    const [title, setTitle] = useState("Thương hiệu sản phẩm");
    document.title = title;
    useEffect(function () {
        (async function () {
            try {
                const infobrand = await brandservice.getBySlug(slug);
                const catid = infobrand.data.brand.id;
                setTitle(infobrand.data.brand.name);
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
                        {/* <ListCategory/>
                        <ListBrand/> */}
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

export default ProductBrand