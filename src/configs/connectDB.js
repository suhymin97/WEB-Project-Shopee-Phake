import mysql from 'mysql2';

// create the connection to database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: "Admin2442001",
    database: 'mydb'
});

export default connection;