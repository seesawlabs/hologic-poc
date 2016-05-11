  angular.module 'titan'
    .component 'menus',
      template: '<ng-outlet></ng-outlet>',
      $routeConfig: [
        path: '/'
        name: 'Menu'
        component: 'menu'
        useAsDefault: true
      ,
        path: '/:name'
        name: 'MenuItem'
        component: 'menuItem'

      ,
        path: 'video/:videoId'
        name: 'TridentVideo'
        component: 'tridentVideo'

      ]
