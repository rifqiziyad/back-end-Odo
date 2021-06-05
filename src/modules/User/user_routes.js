const express = require('express')
const Route = express.Router()
const uploadImage = require('../../middleware/uploads')

const {
  updatePin,
  getUserDataById,
  updatePassword,
  updateProfile,
  updateImage,
  getAllData
} = require('./user_controller')

Route.patch('/pin/:id', updatePin)
Route.patch('/password/:id', updatePassword)
Route.patch('/profile/:id', updateProfile)
Route.patch('/image/:id', uploadImage, updateImage)
Route.get('/:id', getUserDataById)
Route.get('/', getAllData)

module.exports = Route
