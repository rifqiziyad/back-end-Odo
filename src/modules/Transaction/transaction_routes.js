const express = require('express')
const { authentication } = require('../../middleware/auth')
const Route = express.Router()

const {
  createTransaction,
  getTransactionHistory,
  getTransferDataByWeek,
  getTransferDataByMonth,
  getTransactionDataByDayOnWeek
} = require('./transaction_controller')

Route.post('/', authentication, createTransaction)
Route.get('/:id', authentication, getTransactionHistory)
Route.get('/week/:id', authentication, getTransferDataByWeek)
Route.get('/month/:id', authentication, getTransferDataByMonth)
Route.get('/day/:id', authentication, getTransactionDataByDayOnWeek)

module.exports = Route
