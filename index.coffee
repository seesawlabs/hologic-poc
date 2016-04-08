'use strict'

express = require 'express'
config = require './config'
app = express()
port = process.env.port or 8008

app.use express.static 'public'

app.listen port, ->
  console.log "** APPLICATION STARTED: http://localhost:#{port}"