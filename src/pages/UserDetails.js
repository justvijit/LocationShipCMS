import '../App.css';
import { useState, useEffect } from "react"
import { useParams } from 'react-router-dom';
export default function UsersDetails(props) {
    const [userDetails, setUserDetails] = useState([]);
    const [userActivity, setUserActivity] = useState([]);
    const [userTags, setUserTags] = useState([]);
    const { userid } = useParams();
    const getUserDetails = async () => {
        await window.apiCall('GET', '/userdetails/?userid=' + userid, '', true, function (result) {
            console.log(result);
            setUserDetails(result.data.userdata);
            setUserActivity(result.data.activity);
            setUserTags(result.data.interests);
        })

    }
    useEffect(() => {
        getUserDetails();
    }, []);
    return (
        <>
            <div className='title'>User Details</div>
            <div className='fullheight displayBox'>
                <div className="profilePicture shadow">
                    <img src={'http://15.207.243.148:8081/uploads/'+userDetails.profilepicture}/>
                </div>
                <div className="row">
                    <div className="col-sm-12">
                        <span>Name</span>
                        {userDetails.name}
                    </div>
                    <div className="col-sm-6">
                        <span>Email</span>
                        {userDetails.email}
                    </div>
                    <div className="col-sm-6">
                        <span>Phone</span>
                        {userDetails.phone}
                    </div>
                    <div className="col-sm-6">
                        <span>Date Of Birth</span>
                        {userDetails.dateofbirth}
                    </div>
                    <div className="col-sm-6">
                        <span>Location</span>
                        {userDetails.location}
                    </div>
                    <div className="col-sm-12">
                        <span>Address</span>
                        {userDetails.addree}
                    </div>
                    <div className="col-sm-12">
                        <span>About</span>
                        {userDetails.about}
                    </div>

                    <div className="col-sm-12">
                        <span>Today's Mood</span>
                        {userActivity.activity}
                    </div>


                    <div className="col-sm-12">
                        <span style={{
                            marginBottom:10
                        }}>Interests</span>
                        {
                            userTags.map(tag => {
                                return(
                                    <span className="badge badge-light">{tag.name}</span>
                                )
                            })
                        }
                    </div>

                </div>
            </div>
        </>

    )

}