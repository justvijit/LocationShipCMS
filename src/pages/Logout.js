import '../App.css';
import { useState, useEffect } from "react"
import { Link } from 'react-router-dom';
export default function Logout() {

    window.logoutNow();

    return (
        <>
            <div className='title'>
            Dashboard</div>
            
        </>

    )

}