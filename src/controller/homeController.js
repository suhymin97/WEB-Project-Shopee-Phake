import pool from "../configs/connectDB";
let getHomepage = async (req, res) => {
    //logic
    const [rows, fields] = await pool.execute('SELECT * FROM `shopee_item`');
    return res.render('index.ejs', { dataProduct: rows })
}

let getDetailProduct = async (req, res) => {
    let productId = req.params.id;
    let [product] = await pool.execute(`SELECT * FROM shopee_item WHERE id = ?`, [productId]);
    return res.send(JSON.stringify(product));
}

module.exports = {
    getHomepage, getDetailProduct
}