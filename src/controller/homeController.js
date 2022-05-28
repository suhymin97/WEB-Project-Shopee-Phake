import pool from "../configs/connectDB";
let getHomepage = async (req, res) => {
    //logic
    const [rows, fields] = await pool.execute('SELECT * FROM `shopee_item`');
    return res.render('index.ejs', { dataProduct: rows })
}

let getDetailProduct = async (req, res) => {
    //logic
    let productId = req.params.id;
    let [product] = await pool.execute(`SELECT * FROM shopee_item WHERE id = ?`, [productId]);
    return res.send(JSON.stringify(product));
}

let getDangKiPage = async (req, res) => {
    //logic
    return res.render('form.ejs')
}
let getSellerPage = async (req, res) => {
    //logic
    return res.render('seller.ejs')
}

module.exports = {
    getHomepage, getDetailProduct, getDangKiPage, getSellerPage
}