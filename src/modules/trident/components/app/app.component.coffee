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
        path: '/menus/...'
        name: 'Menus'
        component: 'menus'
      ]
