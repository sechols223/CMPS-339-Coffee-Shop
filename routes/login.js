const express = require('express')
const dotenv = require('dotenv').config()
const router = express.Router()
const db = require('../db/database')
const session = require('express-session')
const SequelizeStore = require('connect-session-sequelize')(session.Store)

function extendDefaultFields(defaults, session) {
  return {
    data: defaults.data,
    expires: defaults.expires,
    userId: session.userId,
  };
}

const sessionStore = new SequelizeStore({
  db: db.sequelize,
  table: "Session",
  extendDefaultFields: extendDefaultFields
})

router.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    proxy: true,
    saveUninitialized: true,
    store: sessionStore
  }))

sessionStore.sync()

const isAuthenticated = require('../middlewares/authentication')
const user = db.User

router.get('/',isAuthenticated, (req,res) => {
})

router.post('/',  async (req,res) => {
    const username = 
    db.sequelize.query(`SELECT password FROM User WHERE username = ${req.body.username} `)
    if (req.body.password == username) {
            req.session.regenerate((err) => {
                if (err) {
                    next(err)
                } else {
                    req.session.userId = db.User.query(
                        `SELECT \"id\" FROM \"Customer\" WHERE username = \'${req.body.username}`
                    )
                    req.session.save((err) => {
                        if (err) {
                            return next(err);
                        } else {
                            res.redirect('/')
                        }
                    })
                }
            })
            
    } else {
        res.send("<h1> User not found </h1>")
    }
})

module.exports = router