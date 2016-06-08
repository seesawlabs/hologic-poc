do (angular)->

  trustAsResourceUrl = ($sce) ->
    (val) ->
      $sce.trustAsResourceUrl val


  trustAsHtml = ($sce) ->
    (val) ->
      $sce.trustAsHtml val

  trustAsResourceUrl.$inject = ['$sce']
  trustAsHtml.$inject = ['$sce']

  angular.module 'trident'
    .filter 'trustAsResourceUrl', trustAsResourceUrl
    .filter 'trustAsHtml', trustAsHtml
