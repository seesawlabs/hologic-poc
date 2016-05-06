do (angular)->
  angular.module 'titan'
    .component 'app',
      templateUrl: 'titan/components/app/app.view.html'
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
