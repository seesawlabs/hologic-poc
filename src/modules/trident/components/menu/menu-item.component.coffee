do (angular)->
  class MenuItemController
    $routerOnActivate: (next, previous) ->
      @name = next.params.name

  angular.module 'trident'
    .component 'menuItem',
      templateUrl: 'trident/components/menu/menu-item.view.html'
      controller: 'MenuItemController as vm'
    .controller 'MenuItemController', MenuItemController
