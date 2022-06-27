const express = require('express')
const router = express.Router()
const db = require('../db/database')
const bodyParser = require('body-parser')
const Customer = db.Customer

    router.get('/', async (req,res) => {
        const [results, metadata] = 
            await db.sequelize.query("SELECT * FROM \"Customer\" ");    
            res.json(results)
    })

    router.get('/:id', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Customer\" 
            WHERE id = ${req.params.id}  `)
            res.json(results)
    })

    
module.exports = router;