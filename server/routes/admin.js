const express = require('express');
const admin = require('../middlewares/admin');
const adminRouter  = express.Router();




adminRouter.post('/admin/add-product' ,admin , async (req , res ,)=>{

    try{
        const { name , description,price , quantity , category , images} = req.body;
        
    }catch (e) {
        res.status(500).json({ error: e.message });
      }
})