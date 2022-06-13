import DateTime, { masks } from "../libs/DateTime";
import pool from "../configs/connectDB";
import req from "express/lib/request";

let getCart = async(req, res) => { //AVu7 for future change
    let uid = req.session.userid;
    const [rows] = await pool.execute(`SELECT C.UID, C.MERCHANT, C.MID, C.PID, C.quantity, C.item_name, C.price, C.EFFDATE
        FROM VCART C WHERE UID = ?`, [uid]);
    return res.render('cart.ejs', { products: rows, loginUser: req.session.username, userId: req.session.userid });
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

let deleteItem = async(req, res) => {
    let pid = req.body.pid;
    let uid = req.session.userid;
    console.log("Del: " + pid + " " + uid);
    await pool.execute(`DELETE FROM cart WHERE UID = ? AND PID = ? `, [uid, pid]);
    return res.redirect('/cart');
}

let updateCart = async(req, res) => {
    let pid = req.body.pid;
    let quantity = req.body.quantity;
    let uid = req.session.userid;
    let date = DateTime();
    for (var i=0; i< quantity.length();i++) {
        await pool.execute(`UPDATE CART SET QUANTITY = ?, EFFDATE = ? WHERE UID = ? AND PID = ?`, [quantity[2], date, uid, 3]);
    }
    return res.send("Success");
}

module.exports = {
    getCart, addCart, deleteItem, updateCart
}