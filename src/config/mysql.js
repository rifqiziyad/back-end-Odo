const mysql = require('mysql2')
require('dotenv').config()

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'odo-app'
})

connection.connect((error) => {
  if (error) throw error
  console.log('You are now connected')
})

module.exports = connection
