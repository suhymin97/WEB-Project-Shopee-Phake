import pool from "../configs/connectDB";
let getHomepage = async (req, res) => {
    //logic
    const [rows, fields] = await pool.execute('SELECT * FROM `shopee_item`');
    return res.render('index.ejs', { dataUser: rows })
}

module.exports = {
    getHomepage
}