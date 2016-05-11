do (angular)->

  angular.module 'trident'
    .component 'static',
      templateUrl: ($rootRouter)->
        'trident/components/static/static.view.html'
