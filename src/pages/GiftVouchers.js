import '../App.css';
import { useState, useEffect } from "react"
import { Link } from 'react-router-dom';
export default function GiftVouchers() {
    const [dataList, setDataList] = useState([]);
    const [showModal, setShowModal] = useState(false);
    const [dataAction, setDataAction] = useState('New Activity');
    const [title, setTitle] = useState('');
    const [id, setId] = useState(0);
    const [code, setCode] = useState('');
    const [company, setCompany] = useState('');
    const [expiry, setExpiry] = useState('');
    const [status, setStatus] = useState('');
    const [campaign, setCampaign] = useState('');
    const [description, setDescription] = useState('');
    const [claims, setClaims] = useState(0);
    const [orgClaims,setOrgClaims] = useState(0);
    const [available, setAvailable] = useState(0);
    const [orgAvailable, setOrgAvailable] = useState(0);
    

    const statusNames = ['Expired','Active','Inactive'];

    const newEntry = () => {
        setDataAction('New Entry');
        setTitle('');
        setId(0);
        setCode('');
        setCompany('');
        setExpiry('');
        setStatus('');
        setCampaign('');
        setDescription('');
        setClaims(0);
        setOrgAvailable(0);
        setAvailable(0);
        setOrgClaims(0);
        setShowModal(true);
    }


    const openDetails = (data) => {
        setDataAction('Voucher Details');
        setTitle(data.title);
        setId(data.id);
        setCode(data.code);
        setCompany(data.company);
        setExpiry(window.formatDate(data.expirydate));
        setStatus(data.status);
        setCampaign(data.campaign);
        setDescription(data.description);
        setClaims(data.claims);
        setOrgClaims(data.claims);
        setAvailable(data.available);
        setOrgAvailable(data.available);
        setShowModal(true);
    }


    const getData = async () => {
        await window.apiCall('GET', '/giftvouchers/?term=', '', true, function (result) {
            setDataList(result.data);
        })
    }


    const saveData = async () => {
        var data = JSON.stringify({
            "title": title,
            "code": code,
            "company": company,
            "description": description,
            "campaign": campaign,
            "status": status,
            "expiry": expiry,
            "claims":claims,
            "available":available,
            "id": id
        });
        await window.apiCall('POST', '/giftvouchers/', data, true, function (result) {
            if (result.status === 1) {
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
                        newEntry();
                    }}>+1 Add New</button>
                </div>
                Gift Vouchers</div>
            <div className='fullheight'>
                <table className='table datatable table-hover table-bordered'>
                    <thead>
                        <tr>
                            <th style={{
                                width: 50
                            }}>#</th><th>Title</th><th>Company</th><th>Expiry</th><th>Status</th><th>Claims</th><th>Campaign</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            dataList.map((row, i) => {
                                if (row.name !== '') {
                                    return (<tr key={row.id} onClick={() => {
                                        openDetails(row);
                                    }}>
                                        <td>{i + 1}</td>
                                        <td className="text-primary">
                                            {row.title}
                                        </td>
                                        <td>
                                            {row.company}
                                        </td>
                                        <td>
                                            {window.formatDate(row.expirydate)}
                                        </td>
                                        <td>
                                            {statusNames[row.status]}
                                        </td>
                                        <td>
                                            {row.claims}
                                        </td>
                                        <td>
                                            {row.campaign}
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
                display: (showModal) ? 'block' : 'none'
            }}></div>
            <div className="modal" id="myModal" style={{
                display: (showModal) ? 'block' : 'none'
            }}>
                <div className="modal-dialog modal-lg">
                    <div className="modal-content">


                        <div className="modal-header">
                            <h6 className="modal-title">{dataAction}</h6>
                            <button type="button" onClick={() => {
                                setShowModal(false);
                            }} className="close" data-dismiss="modal">&times;</button>
                        </div>


                        <div className="modal-body displayBox">

                            <div className="row">
                                <div className="col-sm-12">
                                    <span>Title</span>
                                    <input type="text" className="input" value={title} onChange={e => setTitle(e.target.value)} />
                                </div>
                                <div className="col-sm-6">
                                    <span>Code</span>
                                    <input type="text" className="input" value={code} onChange={e => setCode(e.target.value)} />
                                    </div>
                                <div className="col-sm-6">

                                    <span>Brand Name</span>
                                    <input type="text" className="input" value={company} onChange={e => setCompany(e.target.value)} />
                                    </div>
                                <div className="col-sm-6">

                                    <span>Expiry</span>
                                    <input type="date" className="input" value={expiry} onChange={e => setExpiry(e.target.value)} />
                                    </div>
                                <div className="col-sm-6">

                                    <span>Status</span>
                                    <select className="input" value={status} onChange={e => setStatus(e.target.value)} >
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                        <option value="0">Expired</option>
                                    </select>
                                    </div>
                                    <div className="col-sm-6">
                                    <span>No. Of Claims Allowed</span>
                                    <input type="text" className="input" value={claims} onChange={e => {
                                        setClaims(e.target.value);
                                        if(id == 0){
                                            setAvailable(e.target.value);
                                        }else{
                                            var temp = orgClaims;
                                            var av = orgAvailable;
                                            temp = ((e.target.value) - temp);
                                            temp = temp+av;
                                            if(temp  < 0) temp = 0;
                                            setAvailable(temp);
                                        }
                                    }} />
                                    </div>

                                    <div className="col-sm-6">
                                    <span>Available Claims</span>
                                    <input type="text" className="input" value={available} readOnly={true} />
                                    </div>
                               
                                <div className="col-sm-6">
                                    <span>Campaign</span>
                                    <input type="text" className="input" value={campaign} onChange={e => setCampaign(e.target.value)} />
                                    </div>
                                <div className="col-sm-12">

                                    <span>Description</span>
                                    <textarea className="input" style={{
                                        height:120
                                    }} value={description} onChange={e => setDescription(e.target.value)} ></textarea>

                                    </div>



                            </div>


                            <button className="btn btn-sm btn-primary" onClick={() => {
                                saveData();
                            }}>Save</button>
                        </div>


                        <div className="modal-footer">
                            <button type="button" className="btn btn-danger btn-sm" onClick={() => {
                                setShowModal(false);
                            }} data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>
        </>

    )

}