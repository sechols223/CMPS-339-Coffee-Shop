const express = require('express')
const router = express.Router()
    
    router.get('/api/products', async (req,res) => {
        const [results, metadata] = 
            await db.sequelize.query("SELECT * FROM \"Product\" ");
            res.json(results)
    })

    router.get('/api/products/:id', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Product\" 
            WHERE id = ${req.params.id}`)
            res.json(results)
    })

    router.get('/api/products/:name/:size', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Product\" 
            WHERE name = ${req.params.name} AND size = req.params.size`)
            res.json(results)
    })

    router.post('/api/products', async (req,res) => {
         const [results, metadata] =
        await db.sequelize.query(
            `INSERT INTO \"Product\"(Name, Size)
            VALUES(\'${req.body.Name}\', \'${req.body.Size}\')`
        ) 
        console.log("Product created!")
        //res.json(results)
        res.json({requestBody: req.body})
      })

      module.exports = router;
    
    