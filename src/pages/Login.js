import '../App.css';
import { useState} from "react"
export default function Login(){

    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');

    const checkLogin = async () => {
        var data = JSON.stringify({
            "username": username,
            "password": password
          });              
        await  window.apiCall('POST','/checklogin/',data,false,function(result){
             if(result.status === 1){
                window.loginNow(result.token,result.dbid);
             }
         })
     }
     return (<>
        <div className="row">
            <div className="col-sm-12 loginContainer">
                <div className="loginBox">
                    <div className='loginHead'>
                    Login Now</div>

                    <div className='displayBox'>
                    <span>Username</span>
                    <input type="text" value={username} onChange={e => setUsername(e.target.value)} className='input' />
                    <span>Password</span>
                    <input type="password" value={password} onChange={e => setPassword(e.target.value)} className='input' />
 
                <button className='btn btn-sm btn-primary' onClick={() => {
                    checkLogin()
                }}>Login Now&nbsp;<i className='fas fa-angle-right'></i></button>
                </div>

                </div>
            </div>
        </div>
    
    </>)
}