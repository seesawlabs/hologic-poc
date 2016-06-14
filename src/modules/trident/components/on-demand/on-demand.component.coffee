do (angular)->
  class VideoMenuService
    @$inject: ['$q']
    constructor: (@$q)->
    data: [
      name: 'Setup'
      videos: [
        name: 'Basic unit components'
        videoId: '169557818'
      ,
        name: 'Cabinet Controls and Indicators'
        videoId: '169556236'
      ,
        name: 'Setting Up the Trident&trade; System'
        videoId: '169555983'
      ,
        name: 'X-ray Cabinet Components'
        videoId: '169555766'
      ]
    ,
      name: 'Login/Logout'
      videos: [
        name: 'Login'
        videoId: '169567375'
      ,
        name: 'Logout'
        videoId: '169567120'
      ,
        name: 'System shutdown'
        videoId: '169566711'
      ]
    ,
      name: 'Patient Information'
      videos: [
        name: 'Adding new patients'
        videoId: '169559291'
      ,
        name: 'Deleting Patients'
        videoId: '169559085'
      ,
        name: 'Editing Patient Information'
        videoId: '169558721'
      ,
        name: 'Querying the Worklist'
        videoId: '169558515'
      ,
        name: 'Refreshing the Worklist'
        videoId: '169558349'
      ,
        name: 'Selecting patients'
        videoId: '169558174'
      ]
    ,
      name: 'Specimen'
      videos: [
        name: 'Multi-specimen Imaging'
        videoId: '169555464'
      ,
        name: 'Specimen Imaging'
        videoId: '169576907'
      ,
        name: 'Specimen Imaging Interruptions'
        videoId: '169555243'
      ,
        name: 'Specimen Preparation'
        videoId: '169554935'
      ,
        name: 'X-ray Exposure Control'
        videoId: '169554622'
     ]
    ,
      name: 'Image Review Tools'
      videos: [
        name: 'Annotations'
        videoId: '169571205'
      ,
        name: 'Camera'
        videoId: '169576640'
      ,
        name: 'Comments'
        videoId: '169576402'
      ,
        name: 'Display'
        videoId: '169570946'
      ,
        name: 'Enhanced Visualization'
        videoId: '169570650'
      ,
        name: 'Magnify and Zoom'
        videoId: '169570341'
      ,
        name: 'Multi-up Display'
        videoId: '169570200'
      ,
        name: 'Patient Information'
        videoId: '169569883'
      ,
        name: 'Ruler'
        videoId: '169568237'
      ,
        name: 'Window Level'
        videoId: '169568009'
     ]
    ,
      name: 'Image Output'
      videos: [
        name: 'Exporting Images to USB or DVD'
        videoId: '169576247'
      ,
        name: 'Managing the Output Queue'
        videoId: '169576062'
      ,
        name: 'Printing Images'
        videoId: '169575876'
      ,
        name: 'Sending Images On Demand'
        videoId: '169571996'
      ,
        name: 'Sending Images Post-Procedure'
        videoId: '170503467'
      ,
        name: 'Sending to a Configured Destination'
        videoId: '169571581'
      ]
    ,
      name: 'Maintenance'
      videos: [
        name: 'Disinfecting the Trident&trade; System'
        videoId: '169566479'
      ,
        name: 'General Cleaning'
        videoId: '169566102'
      ,
        name: 'Keyboard Cleaning'
        videoId: '169565797'
      ,
        name: 'Maintenance Using the Taskbar'
        videoId: '169565242'
      ,
        name: 'Managing Alerts'
        videoId: '169562425'
      ,
        name: 'Performing a Scheduled Gain Calibration'
        videoId: '169562101'
      ,
        name: 'Workstation Cleaning'
        videoId: '169559503'
      ]

    ,
      name: 'System Administration'
      videos: [
        name: 'Displaying Additional Information'
        videoId: '169554411'
      ,
        name: 'Gain Calibration'
        videoId: '169554166'
      ,
        name: 'Manage Operators'
        videoId: '169553867'
      ,
        name: 'Manage Output Groups'
        videoId: '169553521'
      ,
        name: 'Manage Patient Filters'
        videoId: '169553212'
      ,
        name: 'My Settings'
        videoId: '169552944'
      ,
        name: 'Procedure Editor'
        videoId: '169552579'
      ,
        name: 'System Defaults'
        videoId: '169551986'
      ,
        name: 'System Tools'
        videoId: '169551692'
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
