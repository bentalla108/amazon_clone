const express = require('express');
const productRouter  = express.Router();
const {Product} = require('../models/product')
const auth = require('../middlewares/auth')





productRouter.get('/api/get-products' ,auth , async (req , res ,)=>{

    try{
        
        const product = await Product.find({category: req.query.category});
        res.json(product);
        
    }catch (e) {
        res.status(500).json({ error: e.message });
      }
})

productRouter.get("/api/products/search/:name" ,auth , async (req , res ,)=>{

    try{
        
        const product = await Product.find({name: {$regex: req.params.name , $options :"i"}});
        res.json(product);
        
    }catch (e) {
        res.status(500).json({ error: e.message });
      }
})
productRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.user) {
        product.ratings.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    product.ratings.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


productRouter.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let products = await Product.find({});

    products = products.sort((prodA, prodB) => {
      let prodA_Sum = 0;
      let prodB_Sum = 0;

      for (let a = 0; a < prodA.ratings.length; a++) {
        prodA_Sum += prodA.ratings[a].rating;
      }

      for (let b = 0; b < prodB.ratings.length; b++) {
        prodB_Sum += prodB.ratings[b].rating;
      }

      return prodA_Sum > prodB_Sum ? -1 : 1; // Tri inversé
    });

    if (products.length === 0) {
      return res.status(404).json({ msg: "Aucun produit n'a été trouvé." });
    }

    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});






module.exports = productRouter;
