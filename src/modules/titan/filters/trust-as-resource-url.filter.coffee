do (angular)->

  trustAsResourceUrl = ($sce) ->
    (val) ->
      $sce.trustAsResourceUrl val

  trustAsResourceUrl.$inject = ['$sce']

  angular.module 'titan'
    .filter 'trustAsResourceUrl', trustAsResourceUrl
