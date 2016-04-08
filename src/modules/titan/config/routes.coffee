do (angular) ->
  _path = (path) ->
    "titan/views/#{path}.view.html"

  routes = ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state 'app',
        abstract: true
        templateUrl: _path('layout')

      .state 'home',
        url: '/'
        templateUrl: _path('home')
        parent: 'app'

      .state 'video',
        url: '/video'
        templateUrl: _path('video')
        parent: 'app'

  routes.$inject = ['$stateProvider', '$urlRouterProvider']

  angular.module 'titan'
    .config routes
