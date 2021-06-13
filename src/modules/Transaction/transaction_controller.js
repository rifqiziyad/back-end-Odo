const helper = require('../../helpers/wrapper')
const transactionModel = require('./transaction_model')

module.exports = {
  createTransaction: async (req, res) => {
    try {
      const { transactionSenderId, transactionReceiverId } = req.query
      const {
        transactionAmount,
        transactionStatus,
        transactionMessage,
        userPin
      } = req.body
      const setData = {
        transaction_sender_id: transactionSenderId,
        transaction_receiver_id: transactionReceiverId,
        transaction_amount: transactionAmount,
        transaction_status: transactionStatus,
        transaction_message: transactionMessage
      }
      const checkIdUser = await transactionModel.getUserDataById({
        user_id: transactionSenderId
      })

      if (checkIdUser.length > 0) {
        if (checkIdUser[0].user_pin === userPin) {
          const result = await transactionModel.createData(setData)
          return helper.response(res, 200, 'Success Transaction', result)
        } else {
          return helper.response(res, 405, 'Wrong Pin')
        }
      } else {
        return helper.response(
          res,
          404,
          `Data User By Id: ${transactionSenderId} Not Found,`
        )
      }
    } catch (error) {
      helper.response(res, 400, 'Bad Request', error)
    }
  }
}
