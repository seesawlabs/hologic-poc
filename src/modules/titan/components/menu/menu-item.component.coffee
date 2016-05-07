do (angular)->
  class MenuItemController
    $routerOnActivate: (next, previous) ->
      @name = next.params.name

  angular.module 'titan'
    .component 'menuItem',
      templateUrl: 'titan/components/menu/menu-item.view.html'
      controller: 'MenuItemController as vm'
    .controller 'MenuItemController', MenuItemController
