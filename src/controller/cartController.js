import DateTime, { masks } from "../libs/DateTime";
import pool from "../configs/connectDB";
import req from "express/lib/request";

let getCart = async(reg, res) => { //AVu7 for future change
    let uid = req.session.userid;
    const [rows] = await pool.execute(`SELECT * FROM orders WHERE Seller_id = ?`, [sellerId]);
    return res.render('sellerOrderList.ejs', { dataPurchase: rows, loginUser: req.session.username, userId: req.session.userid })
}

 //Mill cart
 let addCart = async(req, res) => {
    let pid = req.body.product;
    let quantity = req.body.quantity;
    let uid = req.session.userid;
    let date = DateTime();
    console.log(pid + " " + quantity + " " + uid + " " + date);
    await pool.execute(`INSERT INTO cart(UID, PID, QUANTITY, EFFDATE) 
            values (?, ?, ?, ?)
            ON DUPLICATE KEY 
            UPDATE QUANTITY = QUANTITY + ?, EFFDATE = ?`, [uid, pid, quantity, date, quantity, date]);
    return res.send({title: "Đã thêm vào giỏ hàng"});
}

module.exports = {
    getCart, addCart
}