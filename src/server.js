import express from 'express'
import configViewEngine from './configs/viewEngine'
import initWebRoute from './route/web'

require('dotenv').config()
const path = require('path');


const session = require('express-session');

const app = express()
const port = process.env.PORT || 8082;
//define static folder
app.use(express.static("public"));
//app.use(express.static(path.join(__dirname, 'public')));

//create session
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

//middleware to support send data from client to server
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


//init viewEngine
configViewEngine(app);
//init route
initWebRoute(app);
//init time zone - Mil
process.env.TZ = 'Asia/Saigon';

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})