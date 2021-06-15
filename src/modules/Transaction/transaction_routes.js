const express = require('express')
const Route = express.Router()

const {
  createTransaction,
  getTransactionHistory,
  getTransferDataByWeek,
  getTransferDataByMonth,
  getTransactionDataByDayOnWeek
} = require('./transaction_controller')

Route.post('/', createTransaction)
Route.get('/:id', getTransactionHistory)
Route.get('/week/:id', getTransferDataByWeek)
Route.get('/month/:id', getTransferDataByMonth)
Route.get('/day/:id', getTransactionDataByDayOnWeek)

module.exports = Route
