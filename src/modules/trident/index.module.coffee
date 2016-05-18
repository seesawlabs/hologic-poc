do (angular) ->


  onRouteChange = ($rootScope, $location) ->
    $rootScope.$on '$locationChangeSuccess', () ->
      root = '/view/'
      template = $location.path()
      template = template.replace(root, '')
      $rootScope.template = template

      jQuery 'body'
        .removeClass()
        .addClass "trident-#{template}"

  onRouteChange.$inject = ['$rootScope', '$location']

  angular.module 'trident', [
    'app.theme'
    'app.core'
    'app.templates'
    'ngComponentRouter'
    'ngAnimate'
  ]
  .value '$routerRootComponent', 'app'
  .run onRouteChange
