do (angular)->

  routeTemplateURL = (@mainmenu, $location)->
    item = @mainmenu.getSelectedOption()
    if !item
      root = '/view/'
      template = $location.path()
      template = template.replace(root, '')
    else
      template = item.name

    "trident/components/static/static-#{template}.view.html"

  routeTemplateURL.$inject = ['MainMenuService', '$location']

  class StaticController
    constructor: ()->
    $routerOnActivate: (next, previous) ->
      @name = next.params.name

  angular.module 'trident'
    .component 'static',
      templateUrl: routeTemplateURL
      controller: 'StaticController as vm'
    .controller 'StaticController', StaticController
