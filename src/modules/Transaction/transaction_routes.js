const express = require('express')
const Route = express.Router()

const { createTransaction } = require('./transaction_controller')

Route.post('/', createTransaction)

module.exports = Route
