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
        name: 'Cabinet Controls and Indicators'
        videoId: '164620633'
      ,
        name: 'Setting Up the Trident&trade; System'
        videoId: '164620633'
      ,
        name: 'X-ray Cabinet Components'
        videoId: '164620633'
      ]
    ,
      name: 'Login/Logout'
      videos: [
        name: 'Log in'
        videoId: '164620633'
      ,
        name: 'Log out'
        videoId: '164620633'
      ,
        name: 'System shutdown'
        videoId: '164620633'
      ]
    ,
      name: 'Patient Information'
      videos: [
        name: 'Adding new patients'
        videoId: '164620633'
      ,
        name: 'Deleting Patients'
        videoId: '164620633'
      ,
        name: 'Editing Patient Information'
        videoId: '164620633'
      ,
        name: 'Querying the Worklist'
        videoId: '164620633'
      ,
        name: 'Refreshing the Worklist'
        videoId: '164620633'
      ,
        name: 'Selecting patients'
        videoId: '164620633'
      ]
    ,
      name: 'Specimen'
      videos: [
        name: 'Multi-specimen Imaging'
        videoId: '164620633'
      ,
        name: 'Specimen Imaging'
        videoId: '164620633'
      ,
        name: 'Specimen Imaging Interruptions'
        videoId: '164620633'
      ,
        name: 'Specimen Preparation'
        videoId: '164620633'
      ,
        name: 'X-ray Exposure Control'
        videoId: '164620633'
     ]
    ,
      name: 'Image Review Tools'
      videos: [
        name: 'Annotations'
        videoId: '164620633'
      ,
        name: 'Camera'
        videoId: '164620633'
      ,
        name: 'Comments'
        videoId: '164620633'
      ,
        name: 'Display'
        videoId: '164620633'
      ,
        name: 'Image Review Tools - Enhanced Visualization'
        videoId: '164620633'
      ,
        name: 'Magnify and Zoom'
        videoId: '164620633'
      ,
        name: 'Multi-up Display'
        videoId: '164620633'
      ,
        name: 'Patient Information'
        videoId: '164620633'
      ,
        name: 'Ruler'
        videoId: '164620633'
      ,
        name: 'Window Level'
        videoId: '164620633'
     ]
    ,
      name: 'Image Output'
      videos: [
        name: 'Exporting Images to USB or DVD'
        videoId: '164620633'
      ,
        name: 'Printing Images'
        videoId: '164620633'
      ,
        name: 'Sending Images On Demand'
        videoId: '164620633'
      ,
        name: 'Sending Images Post-Procedure'
        videoId: '164620633'
      ,
        name: 'Sending to a Configured Destination'
        videoId: '164620633'
      ]
    ,
      name: 'Maintenance'
      videos: [
        name: 'Disinfecting the Trident System'
        videoId: '164620633'
      ,
        name: 'General Cleaning'
        videoId: '164620633'
      ,
        name: 'Keyboard Cleaning'
        videoId: '164620633'
      ,
        name: 'Maintenance Using the Taskbar'
        videoId: '164620633'
      ,
        name: 'Managing Alerts'
        videoId: '164620633'
      ,
        name: 'Performing a Scheduled Gain Calibration'
        videoId: '164620633'
      ,
        name: 'Workstation Cleaning'
        videoId: '164620633'
      ]

    ,
      name: 'System Administration'
      videos: [
        name: 'Displaying Additional Information'
        videoId: '164620633'
      ,
        name: 'Gain Calibration'
        videoId: '164620633'
      ,
        name: 'Manage Operators'
        videoId: '164620633'
      ,
        name: 'Manage Output Groups'
        videoId: '164620633'
      ,
        name: 'Manage Patient Filters'
        videoId: '164620633'
      ,
        name: 'My Settings'
        videoId: '164620633'
      ,
        name: 'Procedure Editor'
        videoId: '164620633'
      ,
        name: 'System Defaults'
        videoId: '164620633'
      ,
        name: 'System Tools'
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
