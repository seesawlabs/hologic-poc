do (angular)->
  class MainMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    selectedOption: undefined
    data: [
      name: 'overview'
      label: 'Overview'
    ,
      name: 'essentials'
      label: 'Essentials'
    ,
      name: 'administration'
      label: 'Administration'
    ,
      name: 'on-demand'
      label: 'On Demand'
    ]

    about: [
      name: 'resources'
      label: 'Resources'
    ,
      name: 'support'
      label: 'Support'
    ,
      name: 'help'
      label: 'Help'
    ]

    getItems: ->
      deferred = @$q.defer()
      deferred.resolve(@data)
      deferred.promise

    getAbout: ->
      deferred = @$q.defer()
      deferred.resolve(@about)
      deferred.promise

    getSelectedOption: ()->
      return @selectedOption

    setSelectedOption: (item)->
      @selectedOption = item

  class MenuController
    @$inject: ['MainMenuService']
    items: []
    about: []

    constructor: (@mainmenu)->
    $onInit: () ->
      @mainmenu
        .getItems()
        .then (@items)=>

      @mainmenu
        .getAbout()
        .then (@about)=>
          console.log @about

    selectOption: (item)->
      @mainmenu.setSelectedOption(item)
      @mainmenu.getSelectedOption()


  angular.module 'trident'
    .component 'menu',
      templateUrl: 'trident/components/menu/menu.view.html'
      controller: 'MenuController as vm'
    .controller 'MenuController', MenuController
    .service 'MainMenuService', MainMenuService
