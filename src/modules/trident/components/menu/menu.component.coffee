do (angular)->
  class MainMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    selectedOption: undefined
    data: [
      name: 'overview'
      # icon: 'refresh'
      # description: 'Review the Trident System features and benefits'
      label: 'Overview'
    ,
      name: 'essentials'
      # icon: 'check-square-o'
      # description: 'Learn how to successfully operate the Trident System'
      label: 'Essentials'
    ,
      name: 'administration'
      # icon: 'gears'
      # description: 'Learn about the Trident System administration features'
      label: 'Administration'
    ,
      name: 'on-demand'
      # icon: 'play-circle-o'
      # description: 'Experience short, discrete Trident System lessons'
      label: 'On Demand'
    ]

    getItems: ->
      deferred = @$q.defer()
      deferred.resolve(@data)
      deferred.promise

    getSelectedOption: ()->
      return @selectedOption

    setSelectedOption: (item)->
      @selectedOption = item

  class MenuController
    @$inject: ['MainMenuService']
    items: []

    constructor: (@mainmenu)->
    $routerOnActivate: () ->
      @mainmenu
        .getItems()
        .then (@items)=>

    selectOption: (item)->
      @mainmenu.setSelectedOption(item)



  angular.module 'trident'
    .component 'menu',
      templateUrl: 'trident/components/menu/menu.view.html'
      controller: 'MenuController as vm'
    .controller 'MenuController', MenuController
    .service 'MainMenuService', MainMenuService
