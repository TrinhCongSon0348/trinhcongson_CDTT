
// const Login = (props) => {
//     return (
//         <div className="login-page">
//             <div className="login-container">
//                 <form>
//                     <div className="mb-2 text-center">
//                         <input type="text" className="form-control" placeholder='Email address or your phone number' />
//                     </div>
//                     <div className="mb-2 text-center">
//                         <input type="password" className="form-control" placeholder="password" />
//                     </div>
//                     <button className="btn btn-primary">Login</button>
//                     <span className="text-center">Forgot your password?</span>
//                     <hr />
//                     <div className="text-center">
//                         <button className="btn btn-success">Create new account</button>
//                     </div>
//                 </form>
//             </div>
//         </div>
//     )
// }
// export default Login;

import { Link } from "react-router-dom";


const Login = (props) => {
    return (
        <div className='login-container mt-3'>
            <div className='container'>
                <div className='row'>
                    <div className='content-left col-md-7 red'>
                        <div className='brand'>
                            Hoi dan IT
                        </div>
                        <div className='detail'>
                            Hoi dan IT hvsjhvbsjvh
                        </div>
                    </div>
                        <div className='content-right col-md-5 d-flex flex-column gap-3 py-3'>
                            <div className='brand d-sm-none'>
                                Hoi dan initFormValue
                            </div>
                            <input type='text' className='form-control' placeholder='Email ackabcvvakjb' />
                            <input type='password' className='form-control' placeholder='Email ackabcvvakjb' />
                            <button className='btn btn-primary'>Login</button>
                            <span className='text-center'>
                                <a className='forgot-password' href='#'>Nhap lai mk</a>
                            </span>
                            <hr />
                            <div className='text-center'>
                                <button className='btn btn-success'>
                                    <Link to="/dang-ky">Tạo tài khoản</Link></button>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    )
}

export default Login;