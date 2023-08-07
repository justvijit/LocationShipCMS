import '../App.css';
import { useState, useEffect } from "react"
import { Link } from 'react-router-dom';
export default function Interests() {
    const [dataList, setDataList] = useState([]);
    const [showModal,setShowModal] = useState(false);
    const [dataAction,setDataAction] = useState('New Activity');
    const [name, setName] = useState('');
    const [id, setId] = useState(0);
    const getData = async () => {
        await window.apiCall('GET', '/interests/?term=', '', true, function (result) {
            setDataList(result.data);
        })
    }


    const saveData = async () => {
        var data = JSON.stringify({
            "name": name,
            "id": id
          });              
        await  window.apiCall('POST','/interests/',data,true,function(result){
             if(result.status === 1){
                setShowModal(false);
                getData();
             }
         })

    }



    useEffect(() => {
        getData();
    }, []);


    return (
        <>
            <div className='title'>
                <div className="buttonRight">
                    <button className="btn btn-sm btn-primary" onClick={() => {
                                        setDataAction('New Entry');
                                        setName('');
                                        setId(0);
                                        setShowModal(true);

                    }}>+1 Add New</button>
                </div>
                Interests</div>
            <div className='fullheight'>
                <table className='table datatable table-hover table-bordered'>
                    <thead>
                        <tr>
                            <th style={{
                                width: 50
                            }}>#</th><th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            dataList.map((row, i) => {
                                if (row.name !== '') {
                                    var thisLink = "/activities/" + row.id;
                                    return (<tr key={row.id} onClick={() => {
                                        setDataAction('Activity Details');
                                        setName(row.name);
                                        setId(row.id);
                                        setShowModal(true);
                                    }}>
                                        <td>{i + 1}</td>
                                        <td className="text-primary">
                                            {row.name}
                                        </td>
                                    </tr>
                                    )

                                }
                            })

                        }

                    </tbody>
                </table>
            </div>
            <div className="modal-backdrop" style={{
                display:(showModal) ? 'block':'none'
            }}></div>
            <div className="modal" id="myModal" style={{
                display:(showModal) ? 'block':'none'
            }}>
                <div className="modal-dialog">
                    <div className="modal-content">


                        <div className="modal-header">
                            <h6 className="modal-title">{dataAction}</h6>
                            <button type="button" onClick={() => {
                                setShowModal(false);
                            }} className="close" data-dismiss="modal">&times;</button>
                        </div>


                        <div className="modal-body displayBox">
                            <span>Name</span>
                            <input type="text" className="input" value={name} onChange={e => setName(e.target.value)} />
                            <button className="btn btn-sm btn-primary" onClick={() => {
                                saveData();
                            }}>Save</button>
                        </div>


                        <div className="modal-footer">
                            <button type="button" className="btn btn-danger btn-sm"  onClick={() => {
                                setShowModal(false);
                            }}  data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>
        </>

    )

}