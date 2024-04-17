import axios from "axios"

const API_KEY = process.env.REACT_APP_API_KEY;

export const instance = axios.create({
    baseURL: 'http://www.omdbapi.com/',
    withCredentials: true,
    headers: {
        'API-KEY': API_KEY,
    },
})