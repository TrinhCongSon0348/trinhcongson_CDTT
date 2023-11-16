// import React, { useState } from "react";
// import "./RegisterAccount.css";
// import { Link } from "react-router-dom";

// const initFormValue = {
//     firstName: "",
//     lastName: "",
//     email: "",
//     password: "",
//     confirmPassword: "",
// };
// const isEmptyValue = (value) => {
//     return !value || value.trim().length < 1;
// };
// const isEmailValue = (email) => {
//     return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email);
// }
// function RegisterAccount() {
//     const [formValue, setFormValue] = useState(initFormValue);
//     const [formError, setFormError] = useState({});
//     const validateForm = () => {
//         const error = {};
//         if (isEmptyValue(formValue.firstName)) {
//             error["firstName"] = "First Name is required";
//         }
//         if (isEmptyValue(formValue.lastName)) {
//             error["lastName"] = "Last Name is required";
//         }
//         if (isEmptyValue(formValue.email)) {
//             error["email"] = "Email is required";
//         } else {
//             if (!isEmailValue(formValue.email)) {
//                 error["email"] = "Email is invalid";
//             }
//         }
//         if (isEmptyValue(formValue.password)) {
//             error["password"] = "Password is required";
//         } else {
//             if (formValue.confirmPassword !== formValue.password) {
//                 error["confirmPassword"] = "Confirm Password not match";
//             }
//         }
//         setFormError(error);

//         return Object.keys(error).length === 0;
//     }
//     const handleChange = (event) => {
//         const { value, name } = event.target;
//         setFormValue({
//             ...formValue,
//             [name]: value,
//         });
//     };

//     const handleSubmit = (event) => {
//         event.preventDefault();
//         if (validateForm()) {
//             console.log("form value", formValue);
//         }
//         else {
//             console.log("form invalid");
//         }

//     }
//     console.log(formError);
//     return (
//         <div className="register-page">
//             <div className="register-form-container">
//                 <h1 className="title">Đăng Ký Tài Khoản</h1>
//                 <form onSubmit={handleSubmit}>
//                     <div>
//                         <label htmlFor="first-name" className="form-label">
//                             First Name
//                         </label>
//                         <input
//                             id="first-name"
//                             className="form-control"
//                             type="text"
//                             name="firstName"
//                             value={formValue.firstName}
//                             onChange={handleChange}
//                         />
//                         {formError.firstName && (
//                             <div className="error-feedback">{formError.firstName}</div>
//                         )}
//                     </div>

//                     <div className="mb-2">
//                         <label htmlFor="last-name" className="form-label">
//                             Last Name
//                         </label>
//                         <input
//                             id="last-name"
//                             className="form-control"
//                             type="text"
//                             name="lastName"
//                             value={formValue.lastName}
//                             onChange={handleChange}
//                         />
//                         {formError.lastName && (
//                             <div className="error-feedback">{formError.lastName}</div>
//                         )}
//                     </div>

//                     <div className="mb-2">
//                         <label htmlFor="email" className="form-label">
//                             Email
//                         </label>
//                         <input
//                             id="email"
//                             className="form-control"
//                             type="text"
//                             name="email"
//                             value={formValue.email}
//                             onChange={handleChange}
//                         />
//                         {formError.email && (
//                             <div className="error-feedback">{formError.email}</div>
//                         )}
//                     </div>

//                     <div className="mb-2">
//                         <label htmlFor="password" className="form-label">
//                             Password
//                         </label>
//                         <input
//                             id="password"
//                             className="form-control"
//                             type="password"
//                             name="password"
//                             value={formValue.password}
//                             onChange={handleChange}
//                         />
//                         {formError.password && (
//                             <div className="error-feedback">{formError.password}</div>
//                         )}
//                     </div>

//                     <div className="mb-2">
//                         <label htmlFor="first-name" className="form-label">
//                             Confirm Password
//                         </label>
//                         <input
//                             id="confirm-password"
//                             className="form-control"
//                             type="password"
//                             name="confirmPassword"
//                             value={formValue.confirmPassword}
//                             onChange={handleChange}
//                         />
//                         {formError.confirmPassword && (
//                             <div className="error-feedback">{formError.confirmPassword}</div>
//                         )}
//                     </div>

//                     <button type="submit" className="submit-btn">
//                         <Link to="/" className="text-dark">
//                             Đăng Ký
//                         </Link>
//                     </button>
//                 </form>
//             </div>
//         </div>
//     );
// }

// export default RegisterAccount;
// import React,{useState} from "react";

// function Register()
// {
//     const [name, setName]=useState("");
//     const[password, setPassword]=useState("");
//     const[email, setEmail]=useState("");
//     function SignUp()
//     {
//         let item={name,password,email};
//         console.warn(item);
        
//     }
//     return(
//         <div className="col-sm-6 offset-sm-3">
//             <h1>User Sign Up</h1>
//             <input type="text" value={name} onChange={(e)=>setName(e.target.value)} className="form-controll"/>
//             <br/>
//             <input type="text" value={password} onChange={(e)=>setPassword(e.target.value)} className="form-controll"/>
//             <br/>
//             <input type="text" value={email} onChange={(e)=>setEmail(e.target.value)} className="form-controll"/>
//             <br/>
//             <button onClick={SignUp} className="btn btn-primary">Sign Up</button>

//         </div>
//     )
// }

// export default Register;