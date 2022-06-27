const app = require("./app");
const db = require('./db/database')

  db.sequelize.sync()
  console.log('database connection successful with tables')

app.listen(8080, () => {
  console.log("Example app listening on port 8080!");
});