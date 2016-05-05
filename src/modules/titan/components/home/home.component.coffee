do (angular)->
  class HomeController
    @$inject: []
    controller: ->

  angular.module 'titan'
    .component 'home',
      templateUrl: 'titan/components/home/home.view.html'
      controller: HomeController
