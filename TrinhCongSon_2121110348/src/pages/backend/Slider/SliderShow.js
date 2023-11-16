import { Link, useNavigate, useParams } from "react-router-dom";
import { FaEdit, FaTrash } from 'react-icons/fa';
import sliderservice from "../../../services/SliderService";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";

function SliderShow() {
    const navigator = useNavigate();
    const { id } = useParams();
    const [slider, setSlider] = useState([]);
    useEffect(function () {
        (async function () {
            await sliderservice.getById(id)
            .then(function (result) {
                setSlider(result.data.slider);
            }
            );
        })();
    }, []);
    async function SliderDelete(id){
        await sliderservice.remove(id).then(function (result) {
            //thong bao
            alert(result.data.message);
            //chuyen huong trang
            navigator("/admin/slider", { replace: true })
        }
        );
    }
    //sliderservice.getById(id)
    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">CHI TIẾT SẢN PHẨM</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/slider" className="btn btn-sm btn-success me-1">
                            Ve danh sach</Link>
                    </div>
                    <Link to={"/admin/slider/update/" + slider.id} className="btn btn-sm btn-primary me-1">
                        <FaEdit />Sua</Link>
                    <button onClick={()=>SliderDelete(slider.id)} className="btn btn-sm btn-danger">
                        <FaTrash />Xoa
                    </button>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-bordered">
                    <thead>
                        <tr>
                            <th style={{ width: 200 }}>Ten truong</th>
                            <th>Gia tri</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Id</th>
                            <td>{slider.id}</td>
                        </tr>
                        <tr>
                            <th>Ten san pham</th>
                            <td>{slider.name}</td>
                        </tr>
                        <tr>
                            <th>Hinh</th>
                            <td>
                                <img src={urlImage+"slider/"+slider.image} alt="Hinh"
                                className="img-fluid" style={{maxwidth:200}}/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default SliderShow;