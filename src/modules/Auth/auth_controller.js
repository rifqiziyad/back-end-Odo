const helper = require('../../helpers/wrapper')
const bcrypt = require('bcrypt')
const authModel = require('./auth_model')
const jwt = require('jsonwebtoken')

module.exports = {
  register: async (req, res) => {
    try {
      const { userName, userEmail, userPassword } = req.body
      const salt = bcrypt.genSaltSync(10)
      const encryptPassword = bcrypt.hashSync(userPassword, salt)
      const setData = {
        user_name: userName,
        user_email: userEmail,
        user_password: encryptPassword
      }
      const checkEmailUser = await authModel.checUserData({
        user_email: userEmail
      })
      // cek email
      if (checkEmailUser.length <= 0) {
        const result = await authModel.register(setData)
        delete result.user_passoword
        return helper.response(res, 200, 'Success Register Account', result)
      } else {
        return helper.response(
          res,
          404,
          `${userEmail} already registered`,
          null
        )
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  login: async (req, res) => {
    try {
      const { userEmail, userPassword } = req.body
      const checkEmailUser = await authModel.checUserData({
        user_email: userEmail
      })
      if (checkEmailUser.length > 0) {
        const checkPassword = bcrypt.compareSync(
          userPassword,
          checkEmailUser[0].user_password
        )
        if (checkPassword) {
          const payload = checkEmailUser[0]
          delete payload.user_password
          const token = jwt.sign({ ...payload }, 'RAHASIA', {
            expiresIn: '100'
          })
          const result = { ...payload, token }
          return helper.response(res, 200, 'Succes Login !', result)
        } else {
          return helper.response(res, 404, 'Wrong Password')
        }
      } else {
        return helper.response(res, 404, 'Account not registered', null)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
