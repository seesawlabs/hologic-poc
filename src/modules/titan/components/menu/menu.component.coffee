do (angular)->
  class MainMenuService
    @$inject: ['$q']
    constructor: (@$q)->
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

  class MenuController
    @$inject: ['MainMenuService']
    constructor: (@mainmenu)->
    items: []
    $routerOnActivate: ->
      @mainmenu
        .getItems()
        .then (@items)=>

    @$routeConfig: [
      path: "/"
      path: '/overview'
      name: 'Overview'
      component: 'overview'
    ,
      path: '/essentials'
      name: 'Essentials'
      component: 'essentials'
    ,
      path: '/administration'
      name: 'Administration'
      component: 'administration'
    ,
      path: '/on-demand'
      name: 'OnDemand'
      component: 'onDemand'
    ]
      # @items.map (item)->
      #   path: "/#{item.name}"
      #   name: item.name
      #   component: item.name

  angular.module 'titan'
    .component 'menu',
      templateUrl: 'titan/components/menu/menu.view.html'
      controller: 'MenuController as vm'
      # $routeConfig: [
      #   path: "/"
      #   path: '/overview'
      #   name: 'Overview'
      #   component: 'overview'
      # ,
      #   path: '/essentials'
      #   name: 'Essentials'
      #   component: 'essentials'
      # ,
      #   path: '/administration'
      #   name: 'Administration'
      #   component: 'administration'
      # ,
      #   path: '/on-demand'
      #   name: 'OnDemand'
      #   component: 'onDemand'
      # ]
    .controller 'MenuController', MenuController
    .service 'MainMenuService', MainMenuService
