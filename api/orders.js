const express = require('express')
const router = express.Router()
const db = require('../db/database')
    
    router.get('/api/orders', async (req,res) => {
        const [results, metadata] = 
            await db.sequelize.query("SELECT * FROM \"Order\" ");
            res.json(results)
    })

    router.get('/api/orders/:id', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Order\" 
            WHERE id = ${req.params.id}  `)
            res.json(results)
    })

    router.post('/api/orders', async (req,res) => {
        console.log('Got body:', req);
        const [results, metadata] =
        await db.sequelize.query(
            `INSERT INTO \"Order\"(CustomerId, ProductId, Amount)
            VALUES(\'${req.body.customerid}\', \'${req.body.productid}\', \'${req.body.amount}\')`
        ) 
        console.log("Order created!")
        //res.json(results)
        res.json({requestBody: req.body})
    })
    
