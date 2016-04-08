'use strict'

_ = require 'lodash'
config = require './config'

# Karma configuration
# Generated on Mon Oct 19 2015 10:45:35 GMT-0500 (CDT)

module.exports = (karmaConfig) ->
  configFiles = do ->
    ret = []
    base = 'public'
    _.forEach config.dependencies.js, (paths, root)->
      _.forEach paths, (path)->
        ret.push "#{base}/#{root}/#{path}"

    ret

  karmaConfig.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: ''


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine']


    # list of files / patterns to load in the browser
    files: 
      _.union configFiles, [
        pattern: 'src/tests/**/*.coffee'
        watched: false
      ],[
        pattern: 'src/modules/**/*.coffee'
        watched: true
      ]


    # list of files to exclude
    exclude: []


    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      '**/*.coffee': ['coffee', 'coverage']


    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress', 'dots', 'coverage']


    # web server port
    port: 8089


    # enable / disable colors in the output (reporters and logs)
    colors: true

    coverageReporter:
      type : 'html'
      dir : 'coverage/'


    # level of logging
    # possible values:
    # - karmaConfig.LOG_DISABLE
    # - karmaConfig.LOG_ERROR
    # - karmaConfig.LOG_WARN
    # - karmaConfig.LOG_INFO
    # - karmaConfig.LOG_DEBUG
    logLevel: karmaConfig.LOG_INFO


    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome']


    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false

    client:
        mocha:
            reporter: 'html'
            ui: 'tdd'