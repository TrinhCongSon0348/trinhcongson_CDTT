import { useEffect, useState } from "react";
import categoryservice from "../../../services/CategoryService";
import Slideshow from "./Slideshow";
import ProductHome from "./ProductHome";

function Home() {
    const [categorys, setCategorys] = useState([]);
    useEffect(function () {
        (async function () {
            await categoryservice.getCategoryByParentId(0)
                .then(function (result) {
                    {
                        setCategorys(result.data.categorys);
                    }

                });
        })();
    }, []);
    return (
        <section className="maincontent">
            <div className="slider">
                <Slideshow />
                {categorys.map(function (category, index) {
                    return <ProductHome key={index} category={category} />
                })}
            </div>

        </section>
    );
}

export default Home;
