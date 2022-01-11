const express = require('express');
const { getCurrentOrdersDetails, getPrevOrders } = require('./mypage_database');
const router  = express.Router();

module.exports = (db) => {

  const templateVars = {};

  router.get("/", (req, res) => {

    const userID = Number(req.session.user_id);
    getCurrentOrdersDetails(db, userID)
      .then(data => {
        templateVars.currentOrder = data.currentOrder;
        templateVars.currentOrderTotal = data.currentOrderTotal === null ? data.currentOrderTotal : data.currentOrderTotal[0];
        return getPrevOrders(db, userID);
      })
      .then(data => {
        templateVars.prevOrders = data.prevOrders;
        templateVars.prevOrdersDetail = data.prevDetails;
        templateVars.orderIdList = data.orderIdList;
        console.log(templateVars);
        res.render('mypage', templateVars);
      })
      .catch(err => {
        res
          .status(500)
          .json({ error: err.message });
      });
  });
  return router;
};
