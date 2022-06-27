const express = require('express')
const router = express.Router()
const db = require('../db/database')
    
    router.get('/', async (req,res) => {
        const [results, metadata] = 
            await db.sequelize.query("SELECT * FROM \"Product\" ");
            res.json(results)
    })

    router.get('/:id', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Product\" 
            WHERE id = ${req.params.id}`)
            res.json(results)
    })

    router.get('/:name/:size', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Product\" 
            WHERE name = ${req.params.name} AND size = req.params.size`)
            res.json(results)
    })

    router.post('/create', async (req,res) => {
         const [results, metadata] =
        await db.sequelize.query(
            `INSERT INTO \"Product\"(Name, Size)
            VALUES(\'${req.body.name}\', \'${req.body.size}\')`
        ) 
        console.log("Product created!")
        //res.json(results)
        res.json({requestBody: req.body})
      })

      module.exports = router;
    
    