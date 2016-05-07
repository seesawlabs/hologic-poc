do (angular)->
  class VideoMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    data: [
      name: 'Setup'
      video: '160640015'
    ,
      name: 'Login/Logout'
      video: '160640015'
    ,
      name: 'Patient Information'
      video: '160640015'
    ,
      name: 'Specimen'
      video: '160640015'
    ]

    getItems: ->
      deferred = @$q.defer()
      deferred.resolve(@data)
      deferred.promise

  class OnDemandController
    @$inject: ['VideoMenuService']
    items: []
    constructor: (@videomenu)->
      @videomenu
        .getItems()
        .then (@items)=>

  angular.module 'titan'
    .component 'onDemand',
      templateUrl: 'titan/components/on-demand/on-demand.view.html'
      controller: 'OnDemandController as vm'
    .controller 'OnDemandController', OnDemandController
    .service 'VideoMenuService', VideoMenuService
