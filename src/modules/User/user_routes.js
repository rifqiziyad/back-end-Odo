const express = require('express')
const Route = express.Router()
const uploadImage = require('../../middleware/uploads')

const {
  updatePin,
  getUserDataById,
  updatePassword,
  updateProfile,
  updateImage,
  getAllData,
  updateUserBalance,
  verificationAccount,
  getUsers
} = require('./user_controller')

Route.patch('/pin/:id', updatePin)
Route.patch('/password/:id', updatePassword)
Route.patch('/profile/:id', updateProfile)
Route.patch('/balance', updateUserBalance)
Route.patch('/image/:id', uploadImage, updateImage)
Route.get('/:id', getUserDataById)
Route.get('/', getAllData)
Route.get('/users/all-data', getUsers)
Route.post('/verification/:id', verificationAccount)

module.exports = Route
