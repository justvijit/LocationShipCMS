import '../App.css';
import {useEffect} from "react"
export default function Home(){

    const getUsers = () => {
        var requestOptions = {
            method: 'GET',
            redirect: 'follow'
          };
          
          fetch("http://15.207.243.148:8081/users/", requestOptions)
            .then(response => response.text())
            .then(result => console.log(result))
            .catch(error => console.log('error', error));
    }

    
    useEffect(() => {
        getUsers();
    }, []);


    return (<h1>Home</h1>);
}