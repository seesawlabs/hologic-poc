do (angular) ->


  onRouteChange = ($rootScope, $location) ->
    $rootScope.$on '$locationChangeSuccess', () ->
      root = '/view/'
      template = $location.path()
      template = template.replace(root, '')

      # Removing last of the path.
      if template.indexOf('/') isnt -1
        template = template.substring 0, template.indexOf '/'

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
