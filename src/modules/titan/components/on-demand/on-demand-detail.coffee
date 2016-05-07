do (angular)->
  class OnDemandDetailController
    $routerOnActivate: (next, previous) ->
      @id = next.params.id

  angular.module 'titan'
    .component 'onDemandDetail',
      templateUrl: 'titan/components/on-demand/on-demand-detail.view.html'
      controller: 'OnDemandDetailController as vm'
    .controller 'OnDemandDetailController', OnDemandDetailController
