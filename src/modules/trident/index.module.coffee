do (angular) ->

  angular.module 'trident', [
    'app.theme'
    'app.core'
    'app.templates'
    'ngComponentRouter'
    'ngAnimate'
  ]
  .value '$routerRootComponent', 'app'
