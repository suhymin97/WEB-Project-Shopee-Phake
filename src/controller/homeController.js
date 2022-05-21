import connection from "../configs/connectDB";

let getHomepage = (req, res) => {
    //logic
    let data = [];
    connection.query(
        'SELECT item_name FROM `shopee_item` ',
        function (err, results, fields) {
            results.map((row) => {
                data.push({
                    item_name: row.item_name,
                })

            });

            return res.render('index.ejs', { dataUser: JSON.stringify(data) })
        })
}

module.exports = {
    getHomepage
}