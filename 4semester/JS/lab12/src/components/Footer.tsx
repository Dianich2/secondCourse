import { Link } from 'react-router-dom'
import './css/Footer.css'

export function Footer(){
    return(
        <footer>
                <hr/>
                <div className="symbols">
                <a href='https://vk.com/id440115814'><img src="https://cdn-icons-png.flaticon.com/512/25/25684.png" className='symbol'></img></a>
                <a href='https://www.instagram.com/valentei01/'><img width="50" height="50" src="https://img.icons8.com/ios-filled/50/instagram-new--v1.png" alt="instagram-new--v1" className='symbol'/></a>
                <a href='https://t.me/ValentineKornel'><img width="50" height="50" src="https://img.icons8.com/ios-filled/50/telegram-app.png" alt="telegram-app" className='symbol'/></a>
                </div>
        </footer>
    )
}