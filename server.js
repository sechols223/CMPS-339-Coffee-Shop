const app = require("./app");
app.listen(process.env.PORT || 3000, '0.0.0.0', () => {
  console.log("Example app listening on port 3000!");
});
