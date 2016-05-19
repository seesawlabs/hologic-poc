do (angular)->
  class VideoMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    data: [
      name: 'Setup'
      videos: [
        name: 'Basic unit components'
        videoId: '164620633'
      ,
        name: 'X-ray cabinet component'
        videoId: '164620633'
      ,
        name: 'Cabinet controls and indicators'
        videoId: '164620633'
      ,
        name: 'Multi-up Display'
        videoId: '164620633'
      ,
        name: 'Setting up the Trident System'
        videoId: '164620633'
      ]
    ,
      name: 'Login/Logout'
      videos: [
        name: 'Magnify and Zoom'
        videoId: '164620633'
      ,
        name: 'Window/Level'
        videoId: '164620633'
      ]
    ,
      name: 'Patient Information'
      videos: [
        name: 'Enhanced Visualization'
        videoId: '164620633'
      ,
        name: 'Display'
        videoId: '164620633'
      ]
    ,
      name: 'Specimen'
      videos: [
        name: 'Ruler'
        videoId: '164620633'
      ,
        name: 'Patient Info Display'
        videoId: '164620633'
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

    displayMenu: (item)->
      @selectedItem = item

  angular.module 'trident'
    .component 'onDemand',
      templateUrl: 'trident/components/on-demand/on-demand.view.html'
      controller: 'OnDemandController as vm'

    .controller 'OnDemandController', OnDemandController
    .service 'VideoMenuService', VideoMenuService
