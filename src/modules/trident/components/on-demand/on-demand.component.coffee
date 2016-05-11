do (angular)->
  class VideoMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    data: [
      name: 'Setup'
      videos: [
        name: 'Ruler'
        videoId: '160640015'
      ,
        name: 'Patient Info Display'
        videoId: '165007400'
      ]
    ,
      name: 'Login/Logout'
      videos: [
        name: 'Magnify and Zoom'
        videoId: '160640015'
      ,
        name: 'Window/Level'
        videoId: '165007400'
      ]
    ,
      name: 'Patient Information'
      videos: [
        name: 'Enhanced Visualization'
        videoId: '160640015'
      ,
        name: 'Display'
        videoId: '165007400'
      ]
    ,
      name: 'Specimen'
      videos: [
        name: 'Ruler'
        videoId: '160640015'
      ,
        name: 'Patient Info Display'
        videoId: '165007400'
      ]
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

  angular.module 'trident'
    .component 'onDemand',
      templateUrl: 'trident/components/on-demand/on-demand.view.html'
      controller: 'OnDemandController as vm'

    .controller 'OnDemandController', OnDemandController
    .service 'VideoMenuService', VideoMenuService
