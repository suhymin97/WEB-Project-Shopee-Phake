import express from "express";
import homeController from "../controller/homeController";
import cartController from "../controller/cartController"; //Mill
import path from 'path'
import multer from 'multer'
var appRoot = require('app-root-path');
let router = express.Router();




//----------------------------middleware for upload image------------------------------
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        // console.log('>>> check approot: ', appRoot)
        cb(null, appRoot + '/src/public/image/product/');
    },

    // By default, multer removes file extensions so let's add them back
    filename: function (req, file, cb) {
        //cb(null, req.session.currentImgPid + path.extname(file.originalname));
        cb(null, req.session.currentImgPid + '.jpg');
    }
});
const imageFilter = function (req, file, cb) {
    // Accept images only
    if (!file.originalname.match(/\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF)$/)) {
        req.fileValidationError = 'Only image files are allowed!';
        return cb(new Error('Only image files are allowed!'), false);
    }
    cb(null, true);
};
// init middleware
let upload = multer({ storage: storage, fileFilter: imageFilter });
//let uploadMultipleFiles = multer({ storage: storage, fileFilter: imageFilter }).array('multiple_images', 3);


//----------------------------End middleware for upload image------------------------------

//authentication check middleware
function isAuthenticated(req, res, next) {
    if (req.session.loggedin) next();
    else
        // return res.render('login.ejs');
        return res.redirect('/login');

}

const initWebRoute = (app) => {
    //all routes
    //router.get('/', isAuthenticated, homeController.getHomepage);
    router.get('/', homeController.getHomepage);
    router.get('/product/:id', homeController.getDetailProduct);
    router.get('/dangki', homeController.getDangKiPage);
    router.get('/seller', isAuthenticated, homeController.getSellerPage);
    router.get('/login', homeController.getLoginPage);
    router.get('/logout', homeController.getLogout);
    router.post('/auth', homeController.getAuth);
    router.get('/home', homeController.getHomepage);
    router.post('/upload-new-item-seller', homeController.addNewItemSeller);//carefull here: upload or addNew notation
    router.get('/upload-item-image/:id', homeController.getUploadImageItemPage);
    router.post('/handle-upload-item-image', upload.single('item_image'), homeController.handleUploadItemImage);
    router.post('/delete-item', homeController.deleteItem);
    router.get('/edit-item/:id', homeController.getEditItemPage);
    router.post('/update-item', homeController.handleUpdateItem);
    router.post('/register-new-user', homeController.registerNewUser);
    router.get('/successRegister', homeController.getSuccessRegisterPage);
    //router.get('/buyNow/:uid/:pid/:quantity', isAuthenticated, homeController.getBuyNowPage);
    router.post('/buyNow', isAuthenticated, homeController.getBuyNowPage);
    router.post('/handleOrder', homeController.handleOrder);
    router.get('/successOrder', homeController.getSuccessOrderPage);
    router.get('/buyer/PurchaseList', isAuthenticated, homeController.getBuyerPurchasePage);
    router.get('/seller/OrderList', isAuthenticated, homeController.getSellerOrderPage);
    /* Cart section */
    // router.get('/userCart', cartController.getCart);
    router.post('/addCart', isAuthenticated, cartController.addCart);




    //more route



    return app.use('/', router)
}

export default initWebRoute;