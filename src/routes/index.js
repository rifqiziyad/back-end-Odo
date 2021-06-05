const express = require('express')
const Route = express.Router()

const authRouter = require('../modules/Auth/auth_routes')
const userRouter = require('../modules/User/user_routes')

// Router modules
Route.use('/auth', authRouter)
Route.use('/user', userRouter)

module.exports = Route
