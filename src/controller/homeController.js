import pool from "../configs/connectDB";

let getHomepage = async (req, res) => {
    //logic
    const [rows] = await pool.execute('SELECT * FROM `shopee_item`');
    return res.render('index.ejs', { dataProduct: rows, loginUser: req.session.username, userId: req.session.userid })
}

let getDetailProduct = async (req, res) => {
    //logic
    let productId = req.params.id;
    let [product] = await pool.execute(`SELECT * FROM shopee_item WHERE Pid = ?`, [productId]);
    req.session.redirectTo = `/product/${productId}`;
    //return res.send(JSON.stringify(product));
    return res.render('showProduct.ejs', { infoProduct: product[0], loginUser: req.session.username, userId: req.session.userid })
}

let getDangKiPage = async (req, res) => {
    //logic
    return res.render('form.ejs', { errMsg: '' })
}
let getSellerPage = async (req, res) => {
    //logic
    let sellerId = req.session.userid;
    //console.log(sellerId);
    const [rows] = await pool.execute(`SELECT * FROM shopee_item WHERE seller_id = ?`, [sellerId]);
    return res.render('seller.ejs', { dataProduct: rows, loginUser: req.session.username, userId: req.session.userid, sellerName: req.session.seller })
}
let getLoginPage = async (req, res) => {
    //logic
    return res.render('login.ejs')
}
let getAuth = async (req, res) => {
    //login logic
    //console.log(">>>>Connecting, a user is logging in...");
    /* redirect Page start */
    var redirectTo = req.session.redirectTo || '/home';
    delete req.session.redirectTo;
    /* redirect Page end*/ 
    // Capture the input fields
    let username = req.body.username;
    let password = req.body.password;
    // Ensure the input fields exists and are not empty
    if (username && password) {
        // Execute SQL query that'll select the account from the database based on the specified username and password
        let [results] = await pool.execute('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password]);
        if (results.length > 0) {
            req.session.loggedin = true;
            req.session.username = username;
            req.session.seller = results[0].seller_branch_name;
            req.session.userid = results[0].Uid;
            res.redirect(redirectTo); //req previous
        } else {
            res.send('Incorrect Username and/or Password!');
        }
        res.end();
    }
    else {
        res.send('Please enter Username and Password!');
        res.end();
    }
}

let getLogout = async (req, res) => {
    // logout logic
    // clear the user from the session object and save.
    // this will ensure that re-using the old session id
    // does not have a logged in user
    req.session.user = null
    req.session.save(function (err) {
        if (err) next(err)

        // regenerate the session, which is good practice to help
        // guard against forms of session fixation
        req.session.regenerate(function (err) {
            if (err) next(err)
            res.redirect('/home')
        })
    })
}



let addNewItemSeller = async (req, res) => {
    //console.log("check request: ", req.body);

    let { userId, itemName, itemDescription, itemCategory, itemManufactor, itemShopName,
        itemPrice, itemStorageName, itemClasify, sellerName } = req.body; //get para from form & destructure the object
    //or
    //let firstName = req.body.firstName //like 4 times

    //add item to db
    await pool.execute('insert into shopee_item(seller_id, item_name, description, category, manufactor, shop_name, price, storage_name, product_classify, seller_name) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [userId, itemName, itemDescription, itemCategory, itemManufactor, itemShopName,
            itemPrice, itemStorageName, itemClasify, sellerName]);
    // //add seller name to that item in db
    //await pool.execute(' UPDATE shopee_item t1, accounts t2 SET WHERE t1.seller_id = t2.Uid AND t1.Pid = ?', );
    return res.redirect('/seller');
}
let getUploadImageItemPage = async (req, res) => {
    let productId = req.params.id;
    req.session.currentImgPid = productId;
    return res.render('upload_Item_img.ejs', { userId: req.session.userid })
}

let handleUploadItemImage = async (req, res) => {
    // 'profile_pic' is the name of our file input field in the HTML form

    //console.log(req.file);//check file


    // req.file contains information of uploaded file
    // req.body contains information of text fields, if there were any

    if (req.fileValidationError) {
        return res.send(req.fileValidationError);
    }
    else if (!req.file) {
        return res.send('Please select an image to upload');
    }
    // else if (err instanceof multer.MulterError) {
    //     return res.send(err);
    // }
    // else if (err) {
    //     return res.send(err);
    // }    //multer has already handle the error at client

    // Display uploaded image for user validation
    res.send(`You have uploaded this image: <hr/><img src="/image/product/${req.file.filename}" width="500"><hr /><a href="/seller">Return to seller page</a>`);


}
let deleteItem = async (req, res) => {
    let productId = req.body.productId;
    await pool.execute('delete from shopee_item where Pid = ?', [productId]);
    return res.redirect('/seller');
}
let getEditItemPage = async (req, res) => {
    let id = req.params.id;
    let [product] = await pool.execute('select * from shopee_item where Pid = ?', [id]);
    return res.render('edit-Item.ejs', { dataProduct: product[0] });
}
let handleUpdateItem = async (req, res) => {
    let { itemName, itemDescription, itemCategory, itemManufactor, itemShopName, itemPrice, itemStorageName, itemClasify, Pid } = req.body;

    await pool.execute('update shopee_item set item_name = ?, description = ?, category = ?, manufactor = ?, shop_name = ?, price = ?, storage_name = ?, product_classify = ? where Pid = ?',
        [itemName, itemDescription, itemCategory, itemManufactor, itemShopName, itemPrice, itemStorageName, itemClasify, Pid]);

    return res.redirect('/seller');
}
let registerNewUser = async (req, res) => {
    // var count = Object.keys(req.body).length
    // console.log(count)
    // console.log(req.body)
    // if (count < 6) {
    //     return res.render('form.ejs', { errMsg: 'not enough info' });
    // }
    // else {
    let { username, fullname, email, password, sellerBranch } = req.body;
    if (username == '' || password == '') {
        return res.render('form.ejs', { errMsg: 'You have not enter Username OR/AND Password' });
    }
    else {
        const [rows] = await pool.execute('SELECT username FROM `accounts` where username = ?', [username]);
        if (!rows[0]) {
            await pool.execute('insert into accounts(username, fullname, email, password, seller_branch_name) values(?, ?, ?, ?, ?)',
                [username, fullname, email, password, sellerBranch]);
            return res.redirect('/successRegister');
        }
        else {
            return res.render('form.ejs', { errMsg: 'Duplicate username, please choose another username' });
        }

    }
}

// }
let getSuccessRegisterPage = async (req, res) => {
    return res.render('sucessRegister.ejs');
}
let getBuyNowPage = async (req, res) => {
    //console.log(req.body);
    let { Uid, Pid, quantity, orderLocation } = req.body;
    //console.log(Uid, Pid, quantity, orderLocation);
    let [product] = await pool.execute(`SELECT Pid, price, seller_id, item_name FROM shopee_item WHERE Pid = ?`, [Pid]);
    let total = quantity * product[0].price;

    return res.render('buyNow.ejs', {loginUser: req.session.username, userId: req.session.userid, Uid, total, orderLocation, productInfo: product[0], quantity });
}
let handleOrder = async (req, res) => {
    //set status
    let status = 'Đang chờ vận chuyển';
    //set date & time
    let orderDate = new Date();
    orderDate = orderDate.toLocaleString();
    let { Uid, itemName, Pid, itemPrice, quantity, totalPayment, orderLocation, orderAddress, contactNumber, payMethod } = req.body;
    //console.log(req.body);
    let [sellerId] = await pool.execute(`SELECT seller_id FROM shopee_item WHERE Pid = ?`, [Pid]);
    // console.log('>>>Checking...')
    // console.log(sellerId[0]);
    // console.log(sellerId);
    // console.log(sellerId.seller_id);
    // console.log(sellerId[0].seller_id);
    // console.log(JSON.stringify(sellerId));
    // console.log(JSON.stringify(sellerId[0]));
    // console.log(JSON.stringify(sellerId.seller_id));
    // console.log(JSON.stringify(sellerId[0].seller_id));
    // console.log('>>>Checking end...')

    await pool.execute('insert into orders(Buyer_id, Item_name, Pid, Seller_id, price, quantity, total, location, address, contact_num, pay_method, status, date_time_order ) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [Uid, itemName, Pid, sellerId[0].seller_id, itemPrice, quantity, totalPayment, orderLocation, orderAddress, contactNumber, payMethod, status, orderDate]);
    return res.redirect('/successOrder');
}
let getSuccessOrderPage = async (req, res) => {
    return res.render('successOrder.ejs');
}
let getBuyerPurchasePage = async (req, res) => {
    let buyerId = req.session.userid;

    const [rows] = await pool.execute(`SELECT * FROM orders WHERE Buyer_id = ?`, [buyerId]);
    return res.render('buyerPurchaseList.ejs', { dataPurchase: rows, loginUser: req.session.username, userId: req.session.userid })

}
let getSellerOrderPage = async (req, res) => {
    let sellerId = req.session.userid;

    const [rows] = await pool.execute(`SELECT * FROM orders WHERE Seller_id = ?`, [sellerId]);
    return res.render('sellerOrderList.ejs', { dataPurchase: rows, loginUser: req.session.username, userId: req.session.userid })

}


module.exports = {
    getHomepage, getDetailProduct, getDangKiPage, getSellerPage, getLoginPage, getAuth, getLogout,
    addNewItemSeller, getUploadImageItemPage, handleUploadItemImage, deleteItem, getEditItemPage,
    handleUpdateItem, registerNewUser, getSuccessRegisterPage, getBuyNowPage, handleOrder, getSuccessOrderPage,
    getBuyerPurchasePage, getSellerOrderPage
}