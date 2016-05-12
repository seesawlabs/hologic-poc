  angular.module 'trident'
    .component 'menus',
      template: '<ng-outlet></ng-outlet>',
      $routeConfig: [
        path: '/'
        name: 'Menu'
        component: 'menu'
        useAsDefault: true
      ,
        path: '/:name'
        name: 'Static'
        component: 'static'
      ,
        path: 'video/:videoId'
        name: 'TridentVideo'
        component: 'tridentVideo'
      ]
