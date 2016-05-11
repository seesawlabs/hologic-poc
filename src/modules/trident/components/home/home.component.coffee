do (angular)->
  class HomeController
    @$inject: []
    controller: ->

  angular.module 'trident'
    .component 'home',
      templateUrl: 'trident/components/home/home.view.html'
      controller: HomeController
