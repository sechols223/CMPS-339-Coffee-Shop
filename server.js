const app = require("./app");
const db = require('./db/database')

try {
  db.sequelize.sync()
} catch (error) {
  Console.log("Could not conenct to db!")
}

app.listen(5678, () => {
  console.log("Example app listening on port 5678!");
});