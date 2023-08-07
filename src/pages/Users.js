import '../App.css';
import { useState, useEffect } from "react"
import { Link } from 'react-router-dom';
export default function Users() {
    const [userList, setUserList] = useState([]);
    const getUsers = async () => {
        await window.apiCall('GET', '/users/', '', true, function (result) {
            setUserList(result.users);
        })
    }

   
    

    useEffect(() => {
        getUsers();
    }, []);


    return (
        <>
            <div className='title'>Users</div>
            <div className='fullheight'>
                <table className='table datatable table-hover table-bordered'>
                    <thead>
                        <tr>
                            <th>#</th><th>Name</th><th>Phone</th><th>Email</th><th>Location</th><th>Reg. Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            userList.map((user,i) => {
                                if(user.name !== ''){
                                    var thisLink = "/users/"+user.id;
                                    return (<tr key={user.id}>
                                        <td>{i+1}</td>
                                        <td className="text-primary">
                                            <Link to={thisLink}>
                                            {user.name}
                                            </Link>
                                        </td>
                                        <td>
                                            {user.phone}
                                        </td>
                                        <td>
                                            {user.email}
                                        </td>
                                        <td>
                                            {user.location}
                                        </td>
                                        <td>
                                            {user.createdate}
                                        </td>
                                        

                                    </tr>
                                    )
    
                                }
                            })

                        }

                    </tbody>
                </table>
            </div>
        </>

    )

}