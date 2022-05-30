import express from "express";
import homeController from "../controller/homeController";
let router = express.Router();


//authentication check middleware
function isAuthenticated(req, res, next) {
    if (req.session.loggedin) next();
    else return res.render('login.ejs');

}

const initWebRoute = (app) => {
    //all routes
    router.get('/', isAuthenticated, homeController.getHomepage);
    router.get('/product/:id', homeController.getDetailProduct);
    router.get('/dangki', homeController.getDangKiPage);
    router.get('/seller', isAuthenticated, homeController.getSellerPage);
    //router.get('/showProduct', homeController.getShowProductPage); //this line just to test showProduct HTML --> use route /prodct/:id instead
    router.get('/login', homeController.getLoginPage);
    router.get('/logout', homeController.getLogout);
    router.post('/auth', homeController.getAuth);
    router.get('/home', homeController.getHomepage);



    //more route



    return app.use('/', router)
}

export default initWebRoute;