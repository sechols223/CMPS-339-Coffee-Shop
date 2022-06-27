const express = require('express')
const router = express.Router()
const db = require('../db/database')
const customer = db.Customer

router.post('/', (req,res) => {
    const Customer = customer.build({
        firstname: req.body.firstnme,
        lastname: req.body.lastname,
        address: req.body.address
    })
    res.json(req.body)
})

module.exports = router