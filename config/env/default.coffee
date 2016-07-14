'use strict'

module.exports =
  title: 'Trident System Virtual On-Demand Training Program'
  port: 8000

  dependencies:
    css:
      # Insert bower or other CSS dependencies here
      'vendor/bower': [
        'animate.css/animate.min.css'
      ]
      '': [
        '/maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'
        '/maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css'
      ]
    js:
      'vendor/bower': [
        'angular/angular.min.js'
        'angular-animate/angular-animate.min.js'
        'angular-component-router/angular_1_router.js'
        'angular-component-router/ng_route_shim.js'
        'jquery/dist/jquery.min.js'
      ]
      '': [
        '/maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'
        '/cdnjs.cloudflare.com/ajax/libs/lodash.js/4.13.1/lodash.min.js'
        '/cdnjs.cloudflare.com/ajax/libs/es6-shim/0.33.3/es6-shim.min.js'
        '/cdnjs.cloudflare.com/ajax/libs/systemjs/0.19.20/system-polyfills.js'
        '/npmcdn.com/angular2/es6/dev/src/testing/shims_for_IE.js'
      ]
