import mysql from 'mysql2/promise';

// create the pool to database
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: "Admin2442001",//change password here
    database: 'mydb'
}
)

export default pool;
