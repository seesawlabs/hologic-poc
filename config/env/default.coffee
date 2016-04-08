'use strict'

module.exports =
  title: 'swingset'
  port: 8000

  dependencies:
    css:
      # Insert bower or other CSS dependencies here
      'vendor/bower': [
        'animate.css/animate.css'
      ]
      '': [
        '/maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'
      ]
    js:
      'vendor/bower': [
        'angular/angular.js'
        'angular-animate/angular-animate.js'
        'angular-ui-router/release/angular-ui-router.js'
      ]
