
import './App.css';
import { Routes, Route } from "react-router-dom"
import { useState, useEffect } from 'react';
import Home from './pages/Home';
import GiftVouchers from './pages/GiftVouchers';
import Menu from './pages/Menu';
import Users from './pages/Users';
import Login from './pages/Login';
import UsersDetails from './pages/UserDetails';
import Activities from './pages/Activities';
import Interests from './pages/Interests';
import ReferralCodes from './pages/ReferralCodes';
import Reports from './pages/Reports';
import Dashboard from './pages/Dashboard';
import Logout from './pages/Logout';


function App() {

  window.showAlertCustom = (type,value) => {
    alert(value);
  }

  window.loginNow = (token,dbid) => {
    localStorage.setItem('USERAUTH',token);
    localStorage.setItem('USERID',dbid);
    setSignedIn(true);
  }

  window.formatDate = (date) => {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}


  const checkLogin = () => {
    if(!localStorage.getItem('USERAUTH')){
      setSignedIn(false);
    }else{
      setSignedIn(true);
    }
  }


    useEffect(() => {
      checkLogin();
    }, []);

  window.logoutNow = () => {
    localStorage.removeItem('USERAUTH');
    localStorage.removeItem('USERID');
    setSignedIn(false);
    window.open('/','_self');
  }


  const [signedIn, setSignedIn] = useState(false);
  const [xhRunning,setXhrRunning] = useState(false);

  const baseUrl = 'http://15.207.243.148:8081/backend';
//    const baseUrl = 'http://localhost:8081/backend';

  window.apiCall = async (type, url, data, authRequired, callBack) => {
    if (type === 'GET') {
      await getApiCall(url, authRequired, callBack);
    } else {
      await postApiCall(url, authRequired, data, callBack);
    }
    return true;
  };

  const getApiCall = async (url, authRequired, callBack) => {
    try {
      
      if (authRequired === true) {
        var currentUserAuth = localStorage.getItem('USERAUTH');
        console.log(currentUserAuth);
      }

      console.log('currentUserAuth');

      var myHeaders = new Headers();
      myHeaders.append('Authorization', currentUserAuth);
      var requestOptions = {
        method: 'GET',
        headers: myHeaders,
        redirect: 'follow',
      };
      url = baseUrl + url;
      setXhrRunning(true);
      fetch(url, requestOptions)
        .then(response => response.text())
        .then(result => {
          setXhrRunning(false);
          result = JSON.parse(result);
          if (result.status === 1) {
            callBack(result);
          } else {
            if ((result.message = 'Unauthorized Access')) {
              window.logoutNow();
              return false;
            } else {
              window.showAlertCustom('Message', result.message);
              return false;
            }
          }
        })
        .catch(error => {
          setXhrRunning(false);
          if (error === 'TypeError: Network request failed') {
            ///        setNetWorkError(true);
          }

          return false;
        });
    } catch (error) {
      console.log(error);
      return false;
    }
  };

  const postApiCall = async (url, authRequired, data, callBack) => {
    try {
      if (authRequired === true) {
        var currentUserAuth = localStorage.getItem('USERAUTH');

      }

      var myHeaders = new Headers();
      myHeaders.append('Content-Type', 'application/json');
      myHeaders.append('Authorization', currentUserAuth);
      var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: data,
        redirect: 'follow',
      };
      url = baseUrl + url;
      setXhrRunning(true);
      fetch(url, requestOptions)
        .then(response => response.text())
        .then(result => {
          setXhrRunning(false);

          result = JSON.parse(result);

          if (result.status === 1) {
            
            callBack(result);
            return true;
          } else {
            if (result.message === 'Unauthorized Access') {
             window.logoutNow();
              return false;
            } else {
              window.showAlertCustom('Message', result.message);
              return false;
            }
          }
        })
        .catch(error => {
          setXhrRunning(false);
          if (error === 'TypeError: Network request failed') {
            //      setNetWorkError(true);
          }

          return false;
        });
    } catch (error) {
      console.log(error);
      return false;
    }
  };


  return (
    <>
    {
      (xhRunning) ? <>
        <div className="loadingSet">
          <div className="loadingBar">
          Loading..
            
          </div>
        </div>
      </> :  <></>
    }
      {
        (signedIn) ? <>
          <div className='row'>
            <div className='col-sm-2'>
              <Menu></Menu>
            </div>
            <div className='col-sm-10'>
              <Routes>
                <Route path="/" element={<Dashboard />} />
                <Route path="/giftvouchers" element={<GiftVouchers />} />
                <Route path="/users" element={<Users />} />
                <Route path="/users/:userid" element={<UsersDetails />} />
                <Route path="/activities" element={<Activities />} />
                <Route path="/interests" element={<Interests />} />
                <Route path="/giftvouchers" element={<GiftVouchers />} />
                <Route path="/referralcodes" element={<ReferralCodes />} />
                <Route path="/reports" element={<Reports />} />
                <Route path="/logout" element={<Logout />} />

                

              </Routes>

            </div>
          </div>
        </> : <> 
          <Login></Login>
        </>
      }

    </>
  );
}

export default App;
