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
        name: 'MenuItem'
        component: 'menuItem'

      ,
        path: 'video/:videoId'
        name: 'TridentVideo'
        component: 'tridentVideo'

      # # Static Pages
      # ,
      #   path: '/essentials'
      #   name: 'Essentials'
      #   component: 'static'
      #   data:
      #     page: 'essentials'
      # ,
      #   path: '/overview'
      #   name: 'Overview'
      #   component: 'static'
      #   data:
      #     page: 'overview'
      # ,
      #   path: '/administration'
      #   name: 'Administration'
      #   component: 'static'
      #   data:
      #     page: 'administration'
      # ,
      #   path: '/on-demand'
      #   name: 'OnDemand'
      #   component: 'static'
      #   data:
      #     page: 'on-demand'
      ]
