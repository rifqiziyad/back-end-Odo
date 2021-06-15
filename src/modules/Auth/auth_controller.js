const helper = require('../../helpers/wrapper')
const bcrypt = require('bcrypt')
const authModel = require('./auth_model')
const jwt = require('jsonwebtoken')
const nodemailer = require('nodemailer')
require('dotenv').config()

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
        const transporter = nodemailer.createTransport({
          host: 'smtp.gmail.com',
          port: 587,
          secure: false, // true for 465, false for other ports
          auth: {
            user: process.env.SMTP_EMAIL, // generated ethereal user
            pass: process.env.SMTP_PASSWORD // generated ethereal password
          }
        })

        const result = await authModel.register(setData)
        delete result.user_passoword
        const mailOptions = {
          from: '"Odo E-Wallet" <rifqiziyad4@gmail.com>', // sender address
          to: userEmail, // list of receivers
          subject: 'Odo E-Wallet - Activation Email', // Subject line
          html: `<b>Click Here to activate </b><form action='http://localhost:3004/backend4/api/v1/user/verification/${result.id}' method="post">
            <button type="submit" name="your_name" value="your_value">Go</button>
        </form>` // html body
        }
        await transporter.sendMail(mailOptions, function (error, info) {
          if (error) {
            console.log(error)
            return helper.response(res, 408, 'Email not send !')
          } else {
            console.log('Email sent:' + info.response)
            return helper.response(res, 200, 'Check Your Email', result)
          }
        })
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
