do (angular)->
  class MainMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    selectedOption: undefined
    data: [
      name: 'overview'
      icon: 'refresh'
      description: 'Review the Trident System features and benefits'
      label: 'For the trident system user'
    ,
      name: 'essentials'
      icon: 'check-square-o'
      description: 'Learn how to successfully operate the Trident System'
      label: 'For the first-time learner'
    ,
      name: 'administration'
      icon: 'gears'
      description: 'Learn about the Trident System administration features'
      label: 'For the system manager'
    ,
      name: 'on-demand'
      icon: 'play-circle-o'
      description: 'Experience short, discrete Trident System lessons'
      label: 'For the on-demand learner'
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
