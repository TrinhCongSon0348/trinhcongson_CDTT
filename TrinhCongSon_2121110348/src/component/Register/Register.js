import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { toast } from 'react-toastify';
import axios from "axios";

const Register = (props) => {
    const [email, setEmail]=useState();
    const [phone, setPhone]=useState();
    const [username, setUsename]=useState();
    const [password, setPassword]=useState();
    const [confirmpassword, setConfirmpassword]=useState();
    const defaultValidInput={
        isValidEmail:true,
        isValidPhone:true,
        isValidPassword:true,
        isValidConfirmPassword:true
    }
    const[objcheckinput, setObjCheckInput]=useState(defaultValidInput);
    const isValidInputs=()=>{
        setObjCheckInput(defaultValidInput);
        if(!email){
            toast.error("Email is required");
            setObjCheckInput({...defaultValidInput, isValidEmail:false});
            return false;
        }
        let regx=/\S+@\S+\.\S+/;
        if(!regx.test(email)){
            setObjCheckInput({...defaultValidInput, isValidEmail:false});
            toast.error("'Please enter a valid email address");
            return false;
        }
        if(!phone){
            toast.error("Phone is required");
            setObjCheckInput({...defaultValidInput, isValidPhone:false});
            return false;
        }
        if(!password){
            toast.error("Password is required");
            setObjCheckInput({...defaultValidInput, isValidPassword:false});
            return false;
        }
        if(password!=confirmpassword){
            toast.error("Your password is not the same");
            setObjCheckInput({...defaultValidInput, isValidConfirmPassword:false});
            return false;
        }

        return true;
    }
    const handelRegister=()=>{
        let check=isValidInputs();
        let userData={email,phone,username,password,confirmpassword};
        console.log("Kiem tra user data:",userData);
    }
    useEffect(()=>{
        axios.get("https://reqres.in/api/users?page=2").then(data=>{
            console.log(">>>Check data axios:", data);
        })
    },[]);
    return (
        <div className='register-container mt-3'>
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
                        <div className="form-group">
                            <label>Email</label>
                            <input type='text' className={objcheckinput.isValidEmail? 'form-control':'form-control is invalid'} placeholder='Email ackabcvvakjb' 
                                value={email} onChange={(event)=>setEmail(event.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <label>Phone Number</label>
                            <input type='text' className={objcheckinput.isValidPhone? 'form-control':'form-control is invalid'} placeholder='Email ackabcvvakjb' 
                             value={phone} onChange={(event)=>setPhone(event.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <label>Username</label>
                            <input type='text' className='form-control' placeholder='Email ackabcvvakjb'
                             value={username} onChange={(event)=>setUsename(event.target.value)} />
                        </div>
                        <div className="form-group">
                            <label>Password</label>
                            <input type='password' className={objcheckinput.isValidPassword? 'form-control':'form-control is invalid'} placeholder='Email ackabcvvakjb'
                             value={password} onChange={(event)=>setPassword(event.target.value)} />
                        </div>
                        <div className="form-group">
                            <label>Nhập lại Password</label>
                            <input type='password' className={objcheckinput.isValidConfirmPassword? 'form-control':'form-control is invalid'} placeholder='Email ackabcvvakjb'
                             value={confirmpassword} onChange={(event)=>setConfirmpassword(event.target.value)} />
                        </div>

                        <button className='btn btn-primary' type="button" onClick={()=> handelRegister()}>Register</button>
                        <span className='text-center'>
                            <a className='forgot-password' href='#'>Nhap lai mk</a>
                        </span>
                        <hr />
                        <div className='text-center'>
                            <button className='btn btn-success'>
                                <Link to="/dang-nhap">Quay lại Login</Link></button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    )
}


export default Register;