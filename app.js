const express = require('express')
const app = express()
const db = require('./db/database')
const port = 3000

try {
    db.sequelize.sync()
} catch (error) {
    Console.log("Could not conenct to db!")
}


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

app.use(express.static(path.join(__dirname, 'client/build')));
app.get('*', (req, res) => { 
  res.sendFile(path.join(__dirname + '/client/build/index.html')) 
});