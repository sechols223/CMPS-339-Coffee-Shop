const express = require('express')
const router = express.Router()
const db = require('../db/database')
const bodyParser = require('body-parser')
    
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

    router.post('/', async (req,res) => {
        console.log('Got body:', req.body);
        const [results, metadata] =
        await db.sequelize.query(
            `INSERT INTO \"Customer\"(firstname, lastname, address)
            VALUES(\'${req.body.firstname}\', \'${req.body.lastname}\', \'${req.body.address}\')`
        ) 
        console.log("Customer created!")
        res.json(results)
        
    })
    
module.exports = router;