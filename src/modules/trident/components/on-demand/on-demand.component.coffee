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
        name: 'Setting up the Trident System'
        videoId: '164620633'
      ,
        name: 'Multi-up Display'
        videoId: '164620633'

      ]
    ,
      name: 'Login/Logout'
      videos: [
        name: 'Logging in the Trident system'
        videoId: '164620633'
      ,
        name: 'Logging out the Trydent system'
        videoId: '164620633'
      ]
    ,
      name: 'Patient'
      videos: [
        name: 'Selecting patients'
        videoId: '164620633'
      ,
        name: 'Adding new patients *INTERACTIVE*'
        videoId: '164620633'
      ,
        name: 'Editing patients'
        videoId: '164620633'
      ,
        name: 'Deleting patients'
        videoId: '164620633'
      ,
        name: 'Applying filters'
        videoId: '164620633'
      ,
        name: 'Refreshing the worklist'
        videoId: '164620633'
      ,
        name: 'Querying the worklist'
        videoId: '164620633'
      ]
    ,
      name: 'Specimen'
      videos: [
        name: 'X-ray exposure control'
        videoId: '164620633'
      ,
        name: 'Specimen preparation'
        videoId: '164620633'
      ,
        name: 'Specimen imaging'
        videoId: '164620633'
      ,
        name: 'Multi-specimen imaging (add procedure) *INTERACTIVE*'
        videoId: '164620633'
      ]
    ,
      name: 'Image Review Tools'
      videos: [
        name: 'Magnify and Zoom *INTERACTIVE*'
        videoId: '164620633'
      ,
        name: 'Window/level (brightness and contrast)'
        videoId: '164620633'
      ,
        name: 'Display (fit to viewport, view actual pixels, mirror, invert)'
        videoId: '164620633'
      ,
        name: 'Multi-up display'
        videoId: '164620633'
      ,
        name: 'Enhanced visualization (sharpness)'
        videoId: '164620633'
      ,
        name: 'Ruler'
        videoId: '164620633'
      ,
        name: 'Patient information'
        videoId: '164620633'
      ,
        name: 'Camera'
        videoId: '164620633'
      ,
        name: 'Comments'
        videoId: '164620633'
      ,
        name: 'Annotations (ellipse, ruler, poly, arrow, free-form text)'
        videoId: '164620633'
      ]

    ,
      name: 'Image Output'
      videos: [
        name: 'Sending images to configured destinations'
        videoId: '164620633'
      ,
        name: 'Sending images on-demand (post-procedure) *INTERACTIVE*'
        videoId: '164620633'
      ,
        name: 'Exporting images to USB or DVD'
        videoId: '164620633'
      ,
        name: 'Printing images'
        videoId: '164620633'
      ,
        name: 'Managing the image output queue'
        videoId: '164620633'
      ]

      ,
        name: 'Maintenance'
        videos: [
          name: 'Managing Alarms (NEW)'
          videoId: '164620633'
        ,
          name: 'Performing a scheduled gain calibration *INTERACTIVE*'
          videoId: '164620633'
        ,
          name: 'Cleaning the Trident system'
          videoId: '164620633'
        ,
          name: 'Disinfecting the Trident system'
          videoId: '164620633'
        ]

      ,
        name: 'System Administration'
        videos: [
          name: 'System Tools (Comments) *INTERACTIVE*'
          videoId: '164620633'
        ,
          name: 'System Defaults (Manual vs. Auto KV mode)'
          videoId: '164620633'
        ,
          name: 'Manage Operators (Add/Edit/Delete Operators)'
          videoId: '164620633'
        ,
          name: 'My Settings'
          videoId: '164620633'
        ,
          name: 'Gain Calibration'
          videoId: '164620633'
        ,
          name: 'Procedure Editor (TBD)'
          videoId: '164620633'
        ,
          name: 'Manage Output Groups (Add/Edit/Delete Output Groups)'
          videoId: '164620633'
        ,
          name: 'Manage Patient Filters (NEW)'
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
