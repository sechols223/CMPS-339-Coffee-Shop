const app = require("./app");
const db = require('./db/database')

  db.sequelize.sync()
  console.log('database connection successful with tables')

app.listen(3001, () => {
  console.log("Example app listening on port 3001!");
});