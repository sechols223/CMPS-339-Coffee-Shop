const supertest = require('supertest')
const app = require('../app.js')
const db = require('../db/database')

beforeAll(() => {
    return db.sequelize.sync()
})


describe("testing the index route", () => {
    it("testing if it works", async () => {

        const response = await supertest(app).get('/')

        expect(response.status).toBe(200)
    })
})

describe("Testing the customers route", () => {
    it("customers router", async () => {
        
        const response = await supertest(app).get('/api/customers')
        expect(response.status).toBe(200)
    })
})