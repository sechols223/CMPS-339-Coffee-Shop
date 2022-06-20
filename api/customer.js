module.exports = (app, db) => {
    
    app.get('/api/customers', async (req,res) => {
        const [results, metadata] = 
            await db.sequelize.query("SELECT * FROM \"Customer\" ");
            res.json(results)
    })

    app.get('/api/customers/:id', async (req,res) => {
        const [results, metadata] = 
        await db.sequelize.query(
            `SELECT * FROM \"Customer\" 
            WHERE id = ${req.params.id}  `)
            res.json(results)
    })

    app.post('/api/customers', (req,res) => {
        console.log('Got body:', req);
        /*const [results, metadata] =
        await db.sequelize.query(
            `INSERT INTO \"Customer\"(firstname, lastname, address)
            VALUES(${req.body.firstname}, ${req.body.lastname}, ${req.body.address})`
        ) */
        console.log("Customer created!")
        //res.json(results)
        res.json({requestBody: req.body})
    })
    
}