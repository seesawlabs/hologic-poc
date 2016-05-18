do (angular)->
  angular.module 'trident'
    .component 'app',
      templateUrl: 'trident/components/app/app.view.html'
      $routeConfig: [
        path: '/home'
        name: 'Home'
        component: 'home'
        useAsDefault: true
      ,
        path: 'view/:name'
        name: 'Static'
        component: 'static'
      ,
        path: 'video/:videoId'
        name: 'TridentVideo'
        component: 'tridentVideo'
      ]
