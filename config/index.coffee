'use strict'

_ = require 'lodash'
_default = require './env/default'

module.exports = _.merge _default, require "./env/#{process.env.NODE_ENV or 'dev'}"