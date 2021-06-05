const helper = require('../../helpers/wrapper')
const userModel = require('./user_model')
const bcrypt = require('bcrypt')
const fs = require('fs')

module.exports = {
  getAllData: async (req, res) => {
    try {
      let { userId, page, limit, search, sort } = req.query
      if (!page) {
        page = '1'
      }
      if (!limit) {
        limit = '10'
      }
      if (!search) {
        search = ''
      }
      if (!sort) {
        sort = 'user_id'
      }
      const totalData = await userModel.getDataCount(userId)
      page = parseInt(page)
      limit = parseInt(limit)
      const totalPage = Math.ceil(totalData / limit)
      const offset = page * limit - limit
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData
      }
      const result = await userModel.getAllUserData(
        userId,
        search,
        sort,
        limit,
        offset
      )
      return helper.response(
        res,
        200,
        'Success Get All User Data',
        result,
        pageInfo
      )
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  updatePin: async (req, res) => {
    try {
      const { id } = req.params
      const { userPin } = req.body
      const setData = {
        user_pin: userPin
      }
      const userId = {
        user_id: id
      }
      const checkUserData = await userModel.getUserDataByCondition({
        user_id: id
      })
      const result = await userModel.updateData(setData, userId, checkUserData)
      if (checkUserData.length > 0) {
        return helper.response(res, 200, 'Success Insert Pin', result)
      } else {
        return helper.response(res, 404, `Id: ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  getUserDataById: async (req, res) => {
    try {
      const { id } = req.params
      const result = await userModel.getUserDataByCondition({
        user_id: id
      })
      if (result.length > 0) {
        return helper.response(
          res,
          200,
          `Success Get User Data By Id: ${id}`,
          result
        )
      } else {
        return helper.response(
          res,
          404,
          `Data User By Id: ${id} Not Found`,
          null
        )
      }
    } catch (error) {
      return helper.response(res, 'Bad Request', 400, error)
    }
  },
  updatePassword: async (req, res) => {
    try {
      const { newPassword, confirmPassword } = req.body
      const { id } = req.params
      const userId = {
        user_id: id
      }
      const userPassword = newPassword === confirmPassword

      const checkUserData = await userModel.getUserDataByCondition(userId)

      if (checkUserData.length > 0) {
        if (userPassword) {
          const salt = bcrypt.genSaltSync(10)
          const encryptPassword = bcrypt.hashSync(confirmPassword, salt)
          const setData = {
            user_password: encryptPassword
          }
          const result = await userModel.updateData(setData, userId)
          return helper.response(res, 200, 'Succes Update Password', result)
        } else {
          return helper.response(res, 403, "password didn't match", null)
        }
      } else {
        return helper.response(
          res,
          404,
          `Data User By Id: ${id} Not Found`,
          null
        )
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  updateProfile: async (req, res) => {
    try {
      const { userName, userEmail, userPhone } = req.body
      const { id } = req.params
      const userId = { user_id: id }
      const setData = {
        user_name: userName,
        user_email: userEmail,
        user_phone: userPhone,
        user_updated_at: new Date(Date.now())
      }
      const checkUserData = await userModel.getUserDataByCondition(userId)
      if (checkUserData.length > 0) {
        const result = await userModel.updateData(setData, userId)
        return helper.response(res, 200, 'Succes Update Profile', result)
      } else {
        return helper.response(res, 404, `Data User By Id: ${id} Not Found`)
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  },
  updateImage: async (req, res) => {
    try {
      const { id } = req.params
      const userId = { user_id: id }
      const setData = {
        user_image: req.file ? req.file.filename : '',
        user_updated_at: new Date(Date.now())
      }
      const checkUserData = await userModel.getUserDataByCondition(userId)
      if (checkUserData.length > 0) {
        if (checkUserData.length > 0) {
          const imageToDelete = checkUserData[0].user_image
          const isImageExist = fs.existsSync(`src/uploads/${imageToDelete}`)

          if (isImageExist && imageToDelete) {
            fs.unlink(`src/uploads/${imageToDelete}`, (err) => {
              if (err) throw err
            })
          }
        }
        const result = await userModel.updateData(setData, userId)
        return helper.response(res, 200, 'Success Update Image', result)
      } else {
        return helper.response(res, 404, 'Failed! No Image Is Updated')
      }
    } catch (error) {
      return helper.response(res, 400, 'Bad Request', error)
    }
  }
}
