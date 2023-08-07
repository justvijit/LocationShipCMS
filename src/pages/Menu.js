import { Link } from 'react-router-dom';
import '../App.css';
export default function Menu(){
    return (<>
        <div className='menu'>
            <div className='logo'>Location Ship</div>
            <Link to="/"><div className="menuItem">Dashbaord</div></Link>
            <Link to="/users"><div className="menuItem">Users</div></Link>
            <Link to="/activities"><div className="menuItem">Activities</div></Link>
            <Link to="/interests"><div className="menuItem">Interests</div></Link>
            <Link to="/giftvouchers"><div className="menuItem">Gift Vouchers</div></Link>
            <Link to="/referralcodes"><div className="menuItem">Referral Codes</div></Link>
            <Link to="/reports"><div className="menuItem">Reports</div></Link>
            <Link to="/logout"><div className="menuItem">Logout</div></Link>
        </div>
    </>);
}