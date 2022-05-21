import express from "express";

const configViewEngine = (app) => {
    app.set("View engine", "ejs");      //config the view engine
    app.set("views", "./src/views");        //let express know where to find view engine code, we use .ejs now istead .html
    app.use(express.static('./src/public'))     //let express access folder name public


}

export default configViewEngine;