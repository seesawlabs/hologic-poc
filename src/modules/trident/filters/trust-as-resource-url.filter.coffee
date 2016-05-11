do (angular)->

  trustAsResourceUrl = ($sce) ->
    (val) ->
      $sce.trustAsResourceUrl val

  trustAsResourceUrl.$inject = ['$sce']

  angular.module 'trident'
    .filter 'trustAsResourceUrl', trustAsResourceUrl
