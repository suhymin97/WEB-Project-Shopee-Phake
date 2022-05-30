import pool from "../configs/connectDB";
let getHomepage = async (req, res) => {
    //logic
    const [rows, fields] = await pool.execute('SELECT * FROM `shopee_item`');
    return res.render('index.ejs', { dataProduct: rows, loginUser: req.session.username })
}

let getDetailProduct = async (req, res) => {
    //logic
    let productId = req.params.id;
    let [product] = await pool.execute(`SELECT * FROM shopee_item WHERE id = ?`, [productId]);
    //return res.send(JSON.stringify(product));
    return res.render('showProduct.ejs', { infoProduct: product[0] })
}

let getDangKiPage = async (req, res) => {
    //logic
    return res.render('form.ejs')
}
let getSellerPage = async (req, res) => {
    //logic
    return res.render('seller.ejs', { loginUser: req.session.username })
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

module.exports = {
    getHomepage, getDetailProduct, getDangKiPage, getSellerPage, getLoginPage, getAuth, getLogout, getShowProductPage
}