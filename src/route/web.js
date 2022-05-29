import express from "express";
import homeController from "../controller/homeController";
let router = express.Router();

const initWebRoute = (app) => {

    router.get('/', homeController.getHomepage);
    router.get('/product/:id', homeController.getDetailProduct);
    router.get('/dangki', homeController.getDangKiPage);
    router.get('/seller', homeController.getSellerPage);
    router.get('/showProduct', homeController.getShowProductPage);
    


    //more route



    return app.use('/', router)
}

//using one of below 
export default initWebRoute;
//module.exports = initWebRoute;