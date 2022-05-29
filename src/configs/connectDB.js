import mysql from 'mysql2/promise';

// create the pool to database
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: "ad23102001",//change password here
    database: 'mydb'
}
)

export default pool;
// Hello WOrld!