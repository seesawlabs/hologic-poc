do (angular) ->

  angular.module 'titan', [
    'app.theme'
    'app.core'
    'app.templates'
    'ngComponentRouter'
    'ngAnimate'
  ]
  .value '$routerRootComponent', 'app'
