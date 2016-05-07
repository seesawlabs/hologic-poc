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
      ]
