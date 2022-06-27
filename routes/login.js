const express = require('express')
const dotenv = require('dotenv').config()
const router = express.Router()
const db = require('../db/database')
const session = require('express-session')
const { QueryTypes } = require('sequelize')
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
    saveUninitialized: false,
    store: sessionStore
  }))

//sessionStore.sync({force: true})

const isAuthenticated = require('../middlewares/authentication')
const user = db.User

router.get('/',isAuthenticated, (req,res) => {
})

router.post('/',  async (req,res) => {
  const user = await db.User.findOne({where: {Password: `${req.body.password}`}})
  const session = await db.Session.findOne({where: {userid: user.id}})
    console.log(user.getDataValue('Password'))
    if (req.body.password === user.getDataValue('Password')) {
      console.log(user.Password)
  
            req.session.regenerate( async (err) => {
                if (err) {
                    console.log(err)
                } else {
                                      
                    req.session.userid = user.id
                    req.session.save((err) => {
                        if (err) {
                            return err;
                        } else {
                          console.log(session.sid)
                            res.redirect('./build/web/index.html')
                        }
                    })
                }
            })
            
    } else {
        res.send("<h1> User not found </h1>")
    }
})

module.exports = router