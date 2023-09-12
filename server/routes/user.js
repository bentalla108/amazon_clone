const express = require('express');
const auth = require('../middlewares/auth');
const {Product , productSchema} = require('../models/product')
const userRouter  = express.Router();
const User = require('../models/user')





userRouter.post('/api/add-to-cart', auth, async (req, res) => {
    try {
      const { id } = req.body;
      const product = await Product.findById(id);
      let user = await User.findById(req.user);
  
      if (user.cart.length === 0) {
        user.cart.push({ product, quantity: 1 });
      } else {
        let productInCart = false;
  
        for (let i = 0; i < user.cart.length; i++) {
          if (user.cart[i].product._id.equals(product._id)) {
            productInCart = true;
            break;
          }
        }
        if (productInCart) {
          const productFoundIndex = user.cart.findIndex((prod) => prod.product._id.equals(product._id));
           const productFoundCopy = { ...user.cart[productFoundIndex]._doc };
          productFoundCopy.quantity += 1;
         
          user.cart[productFoundIndex] = productFoundCopy; // Remplace l'élément dans le panier par la copie mise à jour
        }
  
        /* if (productInCart) {
          const productFound = user.cart.find((prod) => prod.product._id.equals(product._id));

                  productFound.quantity += 1;
         
        }  */else {
          user.cart.push({ product, quantity: 1 });
        }
      }
  
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

userRouter.delete('/api/remove-from-cart/:id', auth, async (req, res) => {
    try {
      const { id } = req.params;
      const product = await Product.findById(id);
      let user = await User.findById(req.user);
  
      
  
        for (let i = 0; i < user.cart.length; i++) {
          if (user.cart[i].product._id.equals(product._id)) {

            if(user.cart[i].quantity ==1){
              user.cart.splice(i,1);
            }
            user.cart[i].quantity -=1;

             
      

          }
        }

      
  
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  
  module.exports = userRouter ;

