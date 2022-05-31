import pool from "../configs/connectDB";
let getHomepage = async (req, res) => {
    //logic
    const [rows, fields] = await pool.execute('SELECT * FROM `shopee_item`');
    return res.render('index.ejs', { dataProduct: rows, loginUser: req.session.username, userId: req.session.userid })
}

let getDetailProduct = async (req, res) => {
    //logic
    let productId = req.params.id;
    let [product] = await pool.execute(`SELECT * FROM shopee_item WHERE Pid = ?`, [productId]);
    //return res.send(JSON.stringify(product));
    return res.render('showProduct.ejs', { infoProduct: product[0] })
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
            res.redirect('/home');
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


let getShowProductPage = async (req, res) => {
    //logic
    return res.render('showProduct.ejs',)
}

let addNewItemSeller = async (req, res) => {
    //console.log("check request: ", req.body);

    let { userId, itemName, itemPrice, ItemCategory, sellerName } = req.body; //get para from form & destructure the object
    //or
    //let firstName = req.body.firstName //like 4 times

    //add item to db
    await pool.execute('insert into shopee_item(seller_id, item_name, price, category, seller_name) values(?, ?, ?, ?, ?)', [userId, itemName, itemPrice, ItemCategory, sellerName]);
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
    let { itemName, price, category, Pid } = req.body;

    await pool.execute('update shopee_item set item_name = ?, price= ?, category = ? where Pid = ?',
        [itemName, price, category, Pid]);

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
            return res.redirect('/successRegiter');
        }
        else {
            return res.render('form.ejs', { errMsg: 'Duplicate username, please choose another username' });
        }

    }
}

// }
let getSuccessRegiterPage = async (req, res) => {
    return res.render('sucessRegister.ejs');
}


module.exports = {
    getHomepage, getDetailProduct, getDangKiPage, getSellerPage, getLoginPage, getAuth, getLogout,
    getShowProductPage, addNewItemSeller, getUploadImageItemPage, handleUploadItemImage, deleteItem,
    getEditItemPage, handleUpdateItem, registerNewUser, getSuccessRegiterPage
}